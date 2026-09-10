@echo off
title DevTool V2
chcp 65001 > nul
setlocal enabledelayedexpansion

if not exist config.txt (
    echo [ERROR_4] Config file "config.txt" not found!
    pause
    exit /b
)

for /f "usebackq tokens=1* delims==" %%a in ("config.txt") do (
    set "%%a=%%b"
)

if defined app_color (
    color %app_color%
)

if not exist "plugins" mkdir plugins

:main_loop
cls
call :logo
call :menu
goto main_loop

:logo
echo.
echo				         ██████╗ ███████╗██╗   ██╗████████╗ ██████╗  ██████╗ ██╗     
echo				         ██╔══██╗██╔════╝██║   ██║╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo				         ██║  ██║█████╗  ██║   ██║   ██║   ██║   ██║██║   ██║██║     
echo				         ██║  ██║██╔══╝  ╚██╗ ██╔╝   ██║   ██║   ██║██║   ██║██║     
echo				         ██████╔╝███████╗ ╚████╔╝    ██║   ╚██████╔╝╚██████╔╝███████╗
echo				         ╚═════╝ ╚══════╝  ╚═══╝     ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝
echo.
echo.
goto :eof

:menu
echo === OPTIONS ===
echo.

set count=0
if exist "plugins\*.bat" (
    for %%f in (plugins\*.bat) do (
        set /a count+=1
        set "plugin[!count!]=%%~nxf"
        echo  !count!^) %%~nf
    )
) else (
    echo [ERROR_1] "plugins" folder is empty, add a .bat files and reload app.
)

echo.
echo  0) Exit
echo.

set "commandNum="
set /p commandNum="Enter a number to run plugin: "

if "%commandNum%"=="0" exit
if "%commandNum%"=="" goto :eof

if %commandNum% GEQ 1 if %commandNum% LEQ %count% (
    cls
    call "plugins\!plugin[%commandNum%]!"
    pause
    goto :eof
)

echo.
echo [ERROR_2] Invalid choice!
pause
goto :eof

:file_missing
echo.
echo [ERROR_3] Could not find the specified file!
echo Please check the configuration or path inside the plugin script.
goto :eof