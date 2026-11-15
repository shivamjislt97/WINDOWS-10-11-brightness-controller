@echo off
title Brightness Control Uninstaller
echo Brightness Control uninstall kar rahe hain...
taskkill /F /IM BrightnessTray.exe >nul 2>&1
powershell -NoProfile -Command "Remove-Item ([Environment]::GetFolderPath('Startup') + '\Brightness Tray.lnk') -ErrorAction SilentlyContinue; Remove-Item ([Environment]::GetFolderPath('Desktop') + '\Brightness Slider.lnk') -ErrorAction SilentlyContinue"
rmdir /S /Q "%LOCALAPPDATA%\BrightnessControl" >nul 2>&1
echo.
echo DONE! App, auto-start aur shortcuts sab remove ho gaye.
echo (Ye install folder delete karne ke liye manually delete kar sakte ho)
timeout /t 3 >nul
