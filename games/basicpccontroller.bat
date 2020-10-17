@echo off
color 0f & title Batch PC Controller
setlocal enabledelayedexpansion

:: Variables
set /a playerfound=0
set /a max_x=8
set /a max_y=8
set /a min_x=1
set /a min_y=1
set /a playerX=5
set /a playerY=5
set grid=
set empty_char=. 
set marker=P 


:gameloop
cls

:: Logic
for /l %%y in (%min_y%,1,%max_y%) do (
	for /l %%x in (%min_x%,1,%max_x%) do (
		set /a playerfound=0
		if %%x EQU !playerX! if %%y EQU !playerY! (
			set grid=!grid!%marker%
			set /a playerfound=1
		) 
		if !playerfound! NEQ 1 set grid=!grid!%empty_char%
	)
	echo !grid!
	set grid=
)

:: Controls
choice /c WASDQ /n /m " "
if %errorlevel% equ 1 if %playerY% GTR %min_y% set /a playerY=(!playerY!-1)
if %errorlevel% equ 3 if %playerY% LSS %max_y% set /a playerY=(!playerY!+1)
if %errorlevel% equ 2 if %playerX% GTR %min_x% set /a playerX=(!playerX!-1)
if %errorlevel% equ 4 if %playerX% LSS %max_x% set /a playerX=(!playerX!+1)
if %errorlevel% equ 5 goto exit

goto gameloop

:exit
endlocal
pause
exit
