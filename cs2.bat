@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title Запуск CS2
color 0A

echo ==========================================
echo            ЗАПУСК COUNTER-STRIKE 2
echo ==========================================
echo.

echo [1/3] Открываю Steam...
start "" "steam://open/main"

set n=0
:wait
timeout /t 2 /nobreak >nul
tasklist /fi "imagename eq steam.exe" 2>nul | find /i "steam.exe" >nul
if errorlevel 1 (
    set /a n+=1
    if !n! lss 45 goto wait
    echo       Steam не поднялся за 90 секунд. Пробую запустить игру всё равно.
    goto launch
)

echo       Steam работает. Жду 5 секунд, чтобы он догрузился...
timeout /t 5 /nobreak >nul
echo.

:launch
echo [2/3] Запускаю Counter-Strike 2...
start "" "steam://rungameid/730"

echo [3/3] Готово. Игра загружается, окно закроется само.
timeout /t 3 /nobreak >nul
exit
