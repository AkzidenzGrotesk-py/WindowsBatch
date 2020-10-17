:: Use WASD and E to place blocks.

@echo off
setlocal enabledelayedexpansion
title Player Controller w/ Collision & color 0f

:: Variables
set /a width=10
set /a height=10
set /a player_x=0
set /a player_y=0

set /a grid_check=0
set /a hull_check=0

set /a hull_x[0]=%width%
set /a hull_y[0]=%height%

set /a hulls=0

set grid_spacing=     
set grid=%grid_spacing%
set player=A 
set hull=[31m#[0m 
set empty=[32mG[0m 
set /a choice=5

:: Functionality

:gameloop
:: Collision Array Counter
:counter
if defined hull_x[!hulls!] ( 
   set /a hulls+=1
   GOTO counter
)
set /a hulls=(!hulls!-1)

cls

:: Generation / Logic
for /l %%y in (0,1,%height%) do (
	for /l %%x in (0,1,%width%) do (
		set /a grid_check=0
		if %%y equ %player_y% if %%x equ %player_x% (
			set grid=!grid!%player%
			set /a grid_check=1
		)
		for /l %%a in (0,1,!hulls!) do (
			if %%y equ !hull_y[%%a]! if %%x equ !hull_x[%%a]! if !grid_check! equ 0 (
				set grid=!grid!%hull%
				set /a grid_check=1
			)
		)
		
		if !grid_check! equ 0 set grid=!grid!%empty%
	)
	echo !grid!
	set grid=%grid_spacing%
)

:: Controls and Collision

set /a choice=7
set /a hull_check=0
choice /c WASDEX /n /m ""

set /a choice=%errorlevel%

set /a minus_y=(!player_y!-1)
set /a plus_y=(!player_y!+1)
set /a minus_x=(!player_x!-1)
set /a plus_x=(!player_x!+1)
set /a hull_classic=(!hulls!+1)

if %choice% equ 1 if %player_y% gtr 0 for /l %%h in (0,1,!hulls!) do if !hull_x[%%h]! equ !player_x! if !hull_y[%%h]! equ %minus_y% set /a hull_check=1
if %choice% equ 1 if %player_y% gtr 0 if !hull_check! equ 0 set /a player_y=(!player_y!-1)
if %choice% equ 1 set player=A 

if %choice% equ 3 if %player_y% lss %height% for /l %%h in (0,1,!hulls!) do if !hull_x[%%h]! equ !player_x! if !hull_y[%%h]! equ %plus_y% set /a hull_check=1
if %choice% equ 3 if %player_y% lss %height% if !hull_check! equ 0 set /a player_y=(!player_y!+1)
if %choice% equ 3 set player=v 

if %choice% equ 2 if %player_x% gtr 0 for /l %%h in (0,1,!hulls!) do if !hull_x[%%h]! equ %minus_x% if !hull_y[%%h]! equ !player_y! set /a hull_check=1
if %choice% equ 2 if %player_x% gtr 0 if !hull_check! equ 0 set /a player_x=(!player_x!-1)
if %choice% equ 2 set player={ 

if %choice% equ 4 if %player_x% lss %width% for /l %%h in (0,1,!hulls!) do if !hull_x[%%h]! equ %plus_x% if !hull_y[%%h]! equ !player_y! set /a hull_check=1
if %choice% equ 4 if %player_x% lss %width% if !hull_check! equ 0 set /a player_x=(!player_x!+1)
if %choice% equ 4 set player=} 

if %choice% equ 5 set /a hull_x[%hull_classic%]=!player_x!
if %choice% equ 5 set /a hull_y[%hull_classic%]=!player_y!

if %choice% equ 6 goto exit

goto gameloop

:exit

endlocal
pause
exit
