@echo off
title DevTool V1
chcp 65001 > nul

if not exist config.txt (
    echo [ERROR] Config file "config.txt" not found!
    pause
    exit /b
)

for /f "usebackq tokens=1* delims==" %%a in ("config.txt") do (
    set "%%a=%%b"
)


for /f "usebackq tokens=1* delims==" %%a in ("config.txt") do (
    set "%%a=%%b"
)

if defined app_color (
    color %app_color%
)

call :logo
goto menu

:logo
echo.
echo.
echo       	 			██████╗ ███████╗██╗   ██╗████████╗ ██████╗  ██████╗ ██╗     
echo       	 			██╔══██╗██╔════╝██║   ██║╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo       	 			██║  ██║█████╗  ██║   ██║   ██║   ██║   ██║██║   ██║██║     
echo       	 			██║  ██║██╔══╝  ╚██╗ ██╔╝   ██║   ██║   ██║██║   ██║██║     
echo       	 			██████╔╝███████╗ ╚████╔╝    ██║   ╚██████╔╝╚██████╔╝███████╗
echo       	 			╚═════╝ ╚══════╝  ╚═══╝     ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo.
goto :eof

:menu
echo 1) Open Google
echo 2) Open Unity
echo 3) Open LibreSprite
echo 4) Open VSCode
echo 5) Exit
echo.

set /p commandNum="Enter a number to open program: "
if "%commandNum%"=="1" call :com1
if "%commandNum%"=="2" call :com2
if "%commandNum%"=="3" call :com3
if "%commandNum%"=="4" call :com4
if "%commandNum%"=="5" exit

pause
cls
call :logo
goto menu

:com1
echo Opening Google...
if not exist "%google_path%" goto :file_missing
start "" "%google_path%"
goto :eof

:com2
echo Opening Unity...
if not exist "%unity_path%" goto :file_missing
start "" "%unity_path%"
goto :eof

:com3
echo Opening LibreSprite...
if not exist "%libresprite_path%" goto :file_missing
start "" explorer.exe "%libresprite_path%"
goto :eof

:com4
echo Opening VSCode...
if not exist "%vsCode_path%" goto :file_missing
start "" explorer.exe "%vscode_path%"
goto :eof

:file_missing
echo.
echo [ERROR] Could not find the file at the path specified in config.txt!
echo Please check the correctness of the path in the configuration
pause
goto :eof