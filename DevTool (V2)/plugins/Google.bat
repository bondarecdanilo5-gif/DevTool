@echo off
echo Opening Google...
if not exist "%google_path%" (
    echo [ERROR] Google path not found: "%google_path%"
    exit /b
)
start "" "%google_path%"