@echo off
color 0f & title Escape Sequence Based Controller
setlocal enabledelayedexpansion

:: Variables
set /a max_x=50
set /a max_y=50
set /a pmax_x=49
set /a pmax_y=49
set /a playerX=2
set /a playerY=2
set "player=P"
set "borderchar=*"

:gameloop
cls

:: Border
for /l %%h in (0,1,%max_x%) do (
	for /l %%w in (0,1,%max_y%) do (
		if %%w equ 0 echo [%%h;%%wH%borderchar%
		if %%w equ %max_x% echo [%%h;%%wH%borderchar%
		if %%h equ 0 echo [%%h;%%wH%borderchar%
		if %%h equ %max_y% echo [%%h;%%wH%borderchar%
	)
)

:: Logic
echo [!playerY!;!playerX!H%player%

:: Controls
echo [!max_y!;0H
choice /c WASDQ /n /m " "
if %errorlevel% equ 1 if !playerY! gtr 2 set /a playerY=(playerY-1)
if %errorlevel% equ 2 if !playerX! gtr 2 set /a playerX=(playerX-1)
if %errorlevel% equ 3 if !playerY! lss %pmax_y% set /a playerY=(playerY+1)
if %errorlevel% equ 4 if !playerX! lss %pmax_x% set /a playerX=(playerX+1)
if %errorlevel% equ 5 goto exit

goto gameloop

:exit
endlocal
pause
exit
