:: Add this to scripts to read the key last pressed.
:: Add this to start the keyboard input system
start call keyboardinput.bat

:: Use this to read the file
:: Reminder: this is a snake-controls style system.
for /f "tokens=1" %%a in (C:\path\to\input.dat) do (
	set "fixed=%%a"
	set "fixed=!fixed:~1,-1!"
)
if "!fixed!" equ "1" echo A key was the last pressed
