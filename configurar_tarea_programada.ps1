# Script para configurar la tarea programada de actualización del Dashboard GEDCO
# Este script debe ejecutarse como Administrador

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Configurando Tarea Programada" -ForegroundColor Cyan
Write-Host "Dashboard GEDCO - Actualización Automática" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar que el archivo .bat existe
$batPath = "C:\Users\sorodriguez\dashboard-gedco-github\actualizar_dashboard.bat"
if (-not (Test-Path $batPath)) {
    Write-Host "[ERROR] No se encuentra el archivo: $batPath" -ForegroundColor Red
    Write-Host "Verifica que la ruta sea correcta." -ForegroundColor Red
    pause
    exit 1
}

Write-Host "[OK] Archivo encontrado: $batPath" -ForegroundColor Green

# Crear la acción (ejecutar el .bat)
$action = New-ScheduledTaskAction -Execute $batPath -WorkingDirectory "C:\Users\sorodriguez\dashboard-gedco-github"

# Crear el disparador (diario a las 8 AM, repetir cada 6 horas indefinidamente)
$trigger = New-ScheduledTaskTrigger -Daily -At 8:00AM
$trigger.Repetition = $(New-ScheduledTaskTrigger -Once -At 8:00AM -RepetitionInterval (New-TimeSpan -Hours 6) -RepetitionDuration (New-TimeSpan -Days 9999)).Repetition

# Configuración de la tarea
$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -RunOnlyIfNetworkAvailable `
    -ExecutionTimeLimit (New-TimeSpan -Hours 1)

# Principal (usuario actual)
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Limited

# Registrar la tarea
try {
    Write-Host "`n[INFO] Registrando tarea programada..." -ForegroundColor Yellow

    # Eliminar tarea existente si ya existe
    $existingTask = Get-ScheduledTask -TaskName "Dashboard GEDCO - Actualización Automática" -ErrorAction SilentlyContinue
    if ($existingTask) {
        Write-Host "[INFO] Eliminando tarea existente..." -ForegroundColor Yellow
        Unregister-ScheduledTask -TaskName "Dashboard GEDCO - Actualización Automática" -Confirm:$false
    }

    Register-ScheduledTask `
        -TaskName "Dashboard GEDCO - Actualización Automática" `
        -Description "Actualiza automáticamente el Dashboard GEDCO cada 6 horas consultando BigQuery y publicando en GitHub Pages" `
        -Action $action `
        -Trigger $trigger `
        -Settings $settings `
        -Principal $principal | Out-Null

    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host "[OK] TAREA PROGRAMADA CONFIGURADA!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Nombre: Dashboard GEDCO - Actualización Automática" -ForegroundColor Cyan
    Write-Host "Frecuencia: Cada 6 horas (08:00, 14:00, 20:00, 02:00)" -ForegroundColor Cyan
    Write-Host "Estado: Habilitada" -ForegroundColor Green
    Write-Host ""
    Write-Host "Puedes verificarla abriendo el Programador de tareas (taskschd.msc)" -ForegroundColor Yellow
    Write-Host ""

    # Preguntar si quiere ejecutar una prueba ahora
    $respuesta = Read-Host "¿Quieres ejecutar una prueba de actualización AHORA? (S/N)"
    if ($respuesta -eq "S" -or $respuesta -eq "s") {
        Write-Host "`n[INFO] Ejecutando prueba de actualización..." -ForegroundColor Yellow
        Start-ScheduledTask -TaskName "Dashboard GEDCO - Actualización Automática"
        Write-Host "[OK] Tarea en ejecución. Revisa el Programador de tareas para ver el progreso." -ForegroundColor Green
        Write-Host "O ejecuta manualmente: $batPath" -ForegroundColor Cyan
    }

} catch {
    Write-Host "`n[ERROR] No se pudo crear la tarea programada:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host "`nIntenta ejecutar este script como Administrador:" -ForegroundColor Yellow
    Write-Host "Clic derecho en PowerShell > Ejecutar como administrador" -ForegroundColor Yellow
    pause
    exit 1
}

Write-Host "`nPresiona cualquier tecla para salir..." -ForegroundColor Gray
pause
