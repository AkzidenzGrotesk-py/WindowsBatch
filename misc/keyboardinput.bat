@echo off
title Keyboard Input & color 0f
setlocal enabledelayedexpansion

echo This tool supports A-Z and 0-9
echo This tool works in a fashion similar to snake.

:keyboardloop
::cls
choice /c ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 /n /m "~ "
echo "!errorlevel!">input.dat

goto keyboardloop

endlocal
pause
exit
