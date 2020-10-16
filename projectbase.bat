:: A good base file to start with when using batch.
:: Use "[command] /?", "help [command]", "help" and "[command] --help" (only for some) to get a good reference

@echo off
color 0f & title Hello, World!
setlocal enabledelayedexpansion

echo Hello, World!

:exit
endlocal
pause
exit
