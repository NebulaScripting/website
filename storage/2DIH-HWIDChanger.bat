::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

:: Key System
echo Welcome to 1DIH HWID Changer.
echo Thanks for using!
set "keyurl=https://pastebin.com/raw/Rvvjmg9D"
set "valid=0"
set /p "userkey=Enter your key: "

:: Fetch keys from Pastebin
for /f %%A in ('powershell -command "(New-Object Net.WebClient).DownloadString('%keyurl%') -split '\r?\n'"') do (
    if "!userkey!" equ "%%A" set "valid=1"
)

if !valid! NEQ 1 (
    echo Invalid key.
    pause
    exit /b
)

:: Generate UUID for HWID
for /f %%A in ('powershell -command "[guid]::NewGuid().ToString()"') do set "hwid=%%A"

:: Modify Registry (Run as Admin to take effect)
powershell -Command "Start-Process cmd -ArgumentList '/c reg add \"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\" /v MachineGuid /t REG_SZ /d %hwid% /f' -Verb RunAs"

echo HWID changed successfully to %hwid%
echo Please restart your PC to save changes!
pause
exit
