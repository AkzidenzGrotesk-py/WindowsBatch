# WindowsBatch
*Full of a mishmash of Windows Batch projects. Larger ones get their own repositories.*

[Batch](https://en.wikipedia.org/wiki/Batch_file) is one of those low-level odd programming languages that is fun to mess with. With some clever things such as [console virtual terminal sequences](https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences?redirectedfrom=MSDN), you can do some very interesting things with it. Because batch is an interpreted language, it is very slow. It also cannot handle floats. If it could handle some higher-level arithmetic (sin, cos, floats, etc.) and was a significant bunch faster, I could definitly make a 3d game engine.

## Individual File Descriptions
This area will have small descriptions for individual files.

- [**projectbase.bat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/projectbase.bat) A good base file to start with when using batch to program.

### WindowsBatch/Games/
- [**basicpccontroller.bat**](https://github.com/AkzidenzGrotesk-py/WindowsBatch/blob/main/games/basicpccontroller.bat) A basic player controller using *choice* for controls and *for /l* to generate gridspace. Edit variables *max_x* and *max_y* to increase playing field, larger sizes will create more lag/loading time.
Works by generating a grid using *for /l* (equivalent to python *for x in range(start, step, end)*), if the x/y of the current grid element is equal to the *playerX* and *playerY* it places a character representing the player. Else, it places an empty character. These icons can be changed by modifing the variables: *empty_char* and *marker*. (do note both of these have spaces after them to add a little bit of padding to make the screen easier to look at.)
