@echo off
echo Thanks for using our HWID Changer! V1.0
setlocal enabledelayedexpansion

for /f %%A in ('powershell -command "[guid]::NewGuid().ToString()"') do set "hwid=%%A"

powershell -Command "Start-Process cmd -ArgumentList '/c reg add \"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\" /v MachineGuid /t REG_SZ /d %hwid% /f' -Verb RunAs"

echo HWID changed successfully to %hwid%
echo Please restart your PC to save changes!
pause
exit
