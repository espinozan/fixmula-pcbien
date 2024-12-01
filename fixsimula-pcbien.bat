@echo off
title SISTEMA EN REPARACIÓN - PROCESO EN CURSO
color 0a
mode con: cols=120 lines=40

:: Generar un ID único para la PC
set /a PC_ID=%random%%random%

:: Asegurar pantalla completa
powershell -Command "& {Add-Type -Name WinAPI -Namespace Win32 -MemberDefinition '[DllImport(\"user32.dll\")]\public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); [DllImport(\"user32.dll\")]\public static extern IntPtr GetConsoleWindow();' -PassThru | Out-Null; $consolePtr = [Win32.WinAPI]::GetConsoleWindow(); [Win32.WinAPI]::ShowWindowAsync($consolePtr, 3)}"

:: Inicio del proceso
cls
echo =============================================================
echo                     SISTEMA EN REPARACIÓN                  
echo =============================================================
echo.
echo Identificación del Sistema: PC-%PC_ID%
echo Fecha y Hora de Inicio: %date% %time%
echo.
echo -------------------------------------------------------------
echo            * NO CIERRE ESTA VENTANA POR FAVOR *             
echo -------------------------------------------------------------
timeout /t 5 >nul

:: Mensajes de progreso
:proceso
cls
echo =============================================================
echo                     SISTEMA EN REPARACIÓN                  
echo =============================================================
echo.
echo Identificación del Sistema: PC-%PC_ID%
echo Fecha y Hora Actual: %date% %time%
echo.
echo -------------------------------------------------------------
echo Progreso de Reparación
echo -------------------------------------------------------------
call :progress_bar
echo Actividad en curso:
call :mostrar_mensaje_progreso
call :abrir_ventana_aleatoria
timeout /t 60 >nul
goto proceso

:: Barra de progreso
:progress_bar
setlocal EnableDelayedExpansion
set /a progreso=%random:~-2,2%
if %progreso% gtr 100 set /a progreso=100
set "bar="
for /l %%A in (1,1,%progreso%) do set "bar=!bar!█"
for /l %%A in (%progreso%,1,100) do set "bar=!bar! "
echo [!bar!] %progreso%% Completado
endlocal
exit /b

:: Mostrar mensajes de progreso
:mostrar_mensaje_progreso
setlocal EnableDelayedExpansion
set "mensajes=Restaurando archivos de sistema;Optimizando servicios;Reparando base de datos;Comprobando integridad de red;Validando permisos;Actualizando configuraciones;Liberando memoria"
for /f "tokens=%random:~-1% delims=;" %%A in ("%mensajes%") do (
    set "mensaje=%%A"
)
echo - !mensaje!...
endlocal
exit /b

:: Abrir ventanas secundarias aleatorias
:abrir_ventana_aleatoria
setlocal EnableDelayedExpansion
set "comandos_aleatorios=ping localhost;ipconfig;netstat -an;tree;systeminfo;tasklist"
set "comando="
for /f "tokens=%random:~-1% delims=;" %%A in ("%comandos_aleatorios%") do (
    set "comando=%%A"
)
start "ACTIVIDAD TÉCNICA" cmd /c ^
    "color %random:~-1%A & mode con: cols=50 lines=15 & echo Ejecutando: !comando! & !comando! & timeout /t 10 >nul"
endlocal
exit /b
