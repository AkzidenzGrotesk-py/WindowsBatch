@echo off
color 0f & title Connect to server.py
setlocal enabledelayedexpansion

set /p "server=[33mEnter Server URL: [0m"

:connect
curl %server%serverdata.dat --silent --output serverdata.dat --fail
type serverdata.dat

echo.
set /p "text=[33m> [0m"

curl %server%server.py --silent --form "dat=%text%"

goto connect

:exit
endlocal
pause
exit
