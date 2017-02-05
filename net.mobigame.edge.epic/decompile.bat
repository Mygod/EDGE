@echo off
SET selfname=%~dp0
SET out=%selfname:~0,-1%\src
del /f /s /q %out%
java -jar -Duser.language=en %selfname:~0,-1%\SYSTEM.EAD\apktool_2.2.2.jar d -fso %out% %1
