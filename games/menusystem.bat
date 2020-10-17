:: WS to navigate UP/DOWN, AD to move into a menu and out of a menu.

@echo off
setlocal EnableDelayedExpansion
title Menu System & color 0f

:: Variables
set /a location=1
set "marker=^$ "
set "lack=  "
set menutitle=My Game Menu
set menuitems[0]=Start
set menuitems[1]=How to Play
set menuitems[2]=Settings
set menuitems[3]=Credits
set menuitems[4]=Quit
set /a menumax=4

:: Menu Loop
:menu_loop
cls
echo %menutitle% & echo.

for /l %%m in (0,1,%menumax%) do (
	if %%m equ %location% (
		echo %marker%!menuitems[%%m]!
	) else (
		echo %lack%!menuitems[%%m]!
	)
)

choice /c WSD /n /m "> "

if %errorlevel% EQU 1 if %location% GTR 0 set /a location=!location!-1
if %errorlevel% EQU 2 if %location% LSS %menumax% set /a location=!location!+1
if %errorlevel% EQU 3 call :response %location%


goto menu_loop

:response
cls
if %1 EQU 0 echo ^< STARTING... LOADING
if %1 EQU 1 echo ^< HOW TO PLAY
if %1 EQU 2 echo ^< SETTINGS
if %1 EQU 3 echo ^< CREDITS
if %1 EQU 4 echo ^< QUITTING... & exit
echo Et perferendis rerum recusandae atque fugiat tempora sapiente id. Ut quia aut laudantium asperiores qui dolorem autem debitis. Cumque facilis ea saepe. Neque aut ad maxime dolore eos sit. Consequatur nam et maxime non sed. Iste praesentium tempore sunt amet ipsam.

choice /c AD /n /m "> "
if %errorlevel% EQU 1 goto menu_loop
if %errorlevel% EQU 2 call :sub_menu %1



endlocal
pause
exit
