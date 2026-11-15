@echo off
title Brightness Control Installer
echo ================================================
echo    BRIGHTNESS CONTROL - NAYE PC PAR INSTALL
echo ================================================
echo.

set "DEST=%LOCALAPPDATA%\BrightnessControl"

if not exist "%~dp0BrightnessTray.exe" (
    echo ERROR: BrightnessTray.exe is file is folder mein nahi mili!
    echo BrightnessTray.exe ko is install.bat ke saath same folder mein rakho.
    pause
    exit /b 1
)

rem Purani chalti hui app band karo (re-install case)
taskkill /F /IM BrightnessTray.exe >nul 2>&1

if not exist "%DEST%" mkdir "%DEST%"
copy /Y "%~dp0BrightnessTray.exe" "%DEST%" >nul
echo [1/3] App copy ho gayi: %DEST%

powershell -NoProfile -Command "$w=New-Object -ComObject WScript.Shell; $exe='%DEST%\BrightnessTray.exe'; $s=$w.CreateShortcut([Environment]::GetFolderPath('Startup')+'\Brightness Tray.lnk'); $s.TargetPath=$exe; $s.Save(); $s2=$w.CreateShortcut([Environment]::GetFolderPath('Desktop')+'\Brightness Slider.lnk'); $s2.TargetPath=$exe; $s2.Save()"
echo [2/3] Windows auto-start + Desktop shortcut: DONE

start "" "%DEST%\BrightnessTray.exe"
echo [3/3] App START ho gayi! Taskbar mein sun (☀) icon check karo.
echo.
echo ================================================
echo    KAISE USE KAREIN:
echo    - Sun icon par LEFT-click  = slider khulega
echo    - Ctrl+Alt+B               = slider open/close
echo    - Ctrl+Alt+Shift+Up/Down   = brightness +5 / -5
echo    - Sun icon RIGHT-click     = 25/50/75/100 quick
echo ================================================
echo.
echo Ho gaya! 2 second mein window band ho jayegi...
timeout /t 3 >nul
