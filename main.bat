:MainName
cls
@echo off
color 30
python --version >NUL 2>&1
if errorlevel 1 goto CheckPython
type logo
title Skylanders Key Calculator
set /p name="~~> Write the name you want for your .keys file: "
if [%name%]==[] goto CheckName
cls

:MainUID
cls
type logo
set /p uid="~~> Write your tag's UID: "
if [%uid%]==[] goto CheckUID
if "%uid:~7,1%"=="" (goto CheckUID)
goto MainGetKeys

:MainGetKeys
echo.
python sklykeys.py -u %uid% > %name%.%uid%.keys
cls
echo .
type logo
python sklykeys.py -u %uid%
echo.
pause
exit

:CheckName
echo.
echo ERROR - The name can't be empty.
pause
goto MainName

:CheckUID
echo.
echo ERROR - Your UID can't be less than 8 Characters
pause
goto MainUID

:CheckPython
color 04
echo ERROR - Python not installed.
start https://www.python.org/
pause
exit

