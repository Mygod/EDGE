@echo off
del /s src\res\*icon.png
xcopy patch src /s
pause
