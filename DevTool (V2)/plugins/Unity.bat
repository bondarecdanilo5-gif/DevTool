@echo off
echo Opening Unity...
if not exist "%google_path%" (
    echo [ERROR] Unity path not found: "%google_path%"
    exit /b
)
start "" "%unity_path%"