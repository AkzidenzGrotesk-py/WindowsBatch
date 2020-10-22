# WindowsBatch
*Full of a mishmash of Windows Batch projects. Larger ones get their own repositories.*

[Batch](https://en.wikipedia.org/wiki/Batch_file) is one of those low-level odd programming languages that is fun to mess with. With some clever things such as [console virtual terminal sequences](https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences?redirectedfrom=MSDN), you can do some very interesting things with it. Because batch is an interpreted language, it is very slow. It also cannot handle floats. If it could handle some higher-level arithmetic (sin, cos, floats, etc.) and was a significant bunch faster, I could definitly make a 3d game engine.

## Individual File Descriptions
This area will have small descriptions for individual files.

- [**projectbase.bat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/projectbase.bat) A good base file to start with when using batch to program.

### /games/
A collection of batch "games"... Well, maybe just some base mechanics but still. Games.

- [**basicpccontroller.bat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/games/basicpccontroller.bat) A basic player controller using *choice* for controls and *for /l* to generate gridspace. Edit variables *max_x* and *max_y* to increase playing field, larger sizes will create more lag/loading time.
Works by generating a grid using *for /l* (equivalent to python *for x in range(start, step, end)*), if the x/y of the current grid element is equal to the *playerX* and *playerY* it places a character representing the player. Else, it places an empty character. These icons can be changed by modifing the variables: *empty_char* and *marker*. (do note both of these have spaces after them to add a little bit of padding to make the screen easier to look at.) *Quick and dirty, probably not the best way of doing this.*
- [**escpccontroller.bat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/games/escpccontroller.bat) This player controller works a little differently. It uses escape sequences instead of the grid system to place the player, this makes it run significantly faster then the basic controller with larger playspace sizes. The code is several lines shorter, even though there is a border system. The controls are the same, except there are *pmax_x* and *pmax_y* which are values one lower than there normal equivalent and the *echo* line above it places the cursor below the playspace. They create a properly sized play space to stop the play from rendering on the border. This uses escape sequence *H* to place the cursor (*ESC\[line;characterH*).
- [**builderpccontroller.bat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/games/builderpccontroller.bat) This one works with the grid system but with a little flair. You can use E to add blocks to the *collision array*. This system is pretty slow because every movement checks through all of the blocks, if you place a lot of blocks it gets slower.
- [**menusystem.bat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/games/menusystem.bat) This works the same as the grid system but with only a *location* axis.

### /hybrid/
Things built with a combination of batch and other programming languages.

- [**/hybrid/connect/**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/tree/main/hybrid/connect) A Python/Batch hybrid program that allows a batch program to append data to a file on a server. *server.py* and *serverdata.py* should be placed in a server somewhere. Call that server and the folder of those files (they should share a directory) in the *server* input variable in the batch file. This uses *curl* to get the website and post data under the **dat** post. That data is written to a file by the python file. This a terribly insecure and stupid way of doing this. But, fun nonetheless.

### /misc/
Miscellaneous tidbits.

- [**/misc/keyboardinput.bat + keyboardreader.bat + input.dat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/misc/keyboardinput.bat) A combination of keyboard stroke readers. *keyboardinput.bat* reads input with *choice* and outputs the last one to *input.dat*. *keyboardreader.bat* is some sample code to utilize this in your tools. This is not a great for several reasons (which will be fixed sometime later): works in a snake controller like manner (just shows last keystroke, making it hard for single outputs), requires *keyboardinput.bat* to be started/called (depends on this CMD file), requires focus on *keyboardinput.bat* and more. Possible solution would be to use a combination of *keyboard* (Python) and batch.

## Using My Programs
Hey, I make a lot of stuff, and there are definitly other people who have come up with the same solutions to problems like mine. You don't need to credit me when using my files in examples or just a fun thing to look at. But, don't claim you made it... Because you didn't. You can credit me if you feel like it, but I'm not going to go after you if you don't credit me.

## Batch Resources
**Want to learn batch?** I would recommend looking through the *help* menu on the CMD (which is just the *help* command). You can look at specific command descriptions using the command followed by */?* or *help* followed by the command (\[*command*\] /? or help \[*command*\]). Most non-builtin functions (so not part of the default batch) like *curl* usually use the help parameter *--help* so *curl --help*. The [Tutorialspoint Batch Script Tutorial](https://www.tutorialspoint.com/batch_script/index.htm) is decent, but a good chunk of their examples don't use syntax that works on my machine. I find [LearnToProgram's Tutorial](http://www.trytoprogram.com/batch-file/) is less detailed but actually uses correct syntax.

When I build batch programs I tend to use a small set of commands (these are commands that are predominant in the programs): *echo*, *if*, *for*, *set*, *choice* and *curl*. Keep in mind non-builtins tend to make programs slower. Try to avoid those commands. Also colors and cursor control is possible (and supported) through [console virtual terminal sequences](https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences?redirectedfrom=MSDN), but you must use the *actual* ESC character → . Which can be typed with ALT+027, in Notepad++ it displays as a rounded-box with the letters ESC in it, on other tools like the GitHub editor, it displays as a red dot.
