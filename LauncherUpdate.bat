@echo off
setlocal

:: === CONFIG ===
set LAUNCHER_NAME=Leo_Launcher.exe
set UPDATE_DIR=Test

echo [PATCHER] Waiting for Leo Launcher to close...

:waitloop
tasklist /fi "imagename eq %LAUNCHER_NAME%" | find /i "%LAUNCHER_NAME%" >nul
if not errorlevel 1 (
    timeout /t 1 >nul
    goto waitloop
)

echo [PATCHER] Launcher closed, uppdaterar filer...

:: Copy new files from update folder into current directory
xcopy "%UPDATE_DIR%\*" "." /e /h /y

:: Clean up update folder
rmdir /s /q "%UPDATE_DIR%"

echo [PATCHER] Updateringen klar, startar launcher...

start "" "%LAUNCHER_NAME%"
exit
