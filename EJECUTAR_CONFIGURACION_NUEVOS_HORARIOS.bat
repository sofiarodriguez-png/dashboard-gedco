@echo off
echo ========================================
echo Configurando Tarea Programada GEDCO
echo Horarios: 10:00, 14:00, 18:00, 04:00
echo ========================================
echo.

schtasks /Create /XML "C:\Users\sorodriguez\dashboard-gedco-github\tarea_programada.xml" /TN "Dashboard GEDCO - Actualización Automática"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo [OK] Tarea programada creada exitosamente!
    echo ========================================
    echo.
    echo La tarea se ejecutará en los siguientes horarios:
    echo   - 10:00 AM
    echo   - 02:00 PM
    echo   - 06:00 PM
    echo   - 04:00 AM
    echo.
) else (
    echo.
    echo ========================================
    echo [ERROR] No se pudo crear la tarea
    echo ========================================
)

pause
