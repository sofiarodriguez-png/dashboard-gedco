@echo off
echo ========================================
echo Verificando Tarea Programada
echo ========================================
echo.

schtasks /Query /TN "Dashboard GEDCO - Actualización Automática" /FO LIST /V

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo [OK] La tarea programada existe!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo [ERROR] La tarea programada NO existe
    echo ========================================
    echo.
    echo Ejecuta: EJECUTAR_CONFIGURACION.bat
    echo (Clic derecho -^> Ejecutar como administrador)
)

echo.
pause
