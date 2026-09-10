@echo off
chcp 65001 > nul
echo    /\_____/\ Cat of Fate
echo   /  o   o  \
echo  ( ==  .  == )
echo   )         (
echo  (           )
echo ( (  )   (  ) )
echo(__(__)___(__)__)
echo.

set /p user_query="Ask a cat: "

:: Перевірка чи не порожнє введення
if "%user_query%"=="" exit /b

:: Генеруємо випадкове число від 1 до 3
set /a rnd=%RANDOM% %% 3 + 1

echo.
echo Cat thinks...
echo.

if %rnd%==1 (
    echo Cat says: Yes
)
if %rnd%==2 (
    echo Cat says: No
)
if %rnd%==3 (
    echo Cat says: Maybe...
)

echo.