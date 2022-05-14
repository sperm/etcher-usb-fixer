@echo off
Net session >nul 2>&1 || (PowerShell start -verb runas '%~0' &exit /b)
cd %~dp0
:start
cls
echo list disk > diskpart
diskpart /s diskpart
set /p disk=Select disk 
echo Confirm disk %disk% [Y/N]
choice /c YN
if %errorlevel%==1 echo fixin atm
if %errorlevel%==2 goto start
(echo select disk %disk%
echo convert gpt
echo clean
echo create partition primary
echo format quick label="cool" override
) > diskpart
diskpart /s diskpart
del /Q diskpart
echo done maybe..
pause