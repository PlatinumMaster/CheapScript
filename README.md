# CheapScript
This plans to be an easier way of scripting in the DS generation of games, using Assembly macros.
### Note:
The build scripts still need a bit of improving, as they were thrown together with some "lazy" coding.

## Setup
### Requirements
devkitPro (r46 is the recommended version).
Python 3.5 or above.


### Usage
As shown in the "example_script.s", you must have the the following lines (replacing "GAME_OF_CHOICE" with your game of choice):
```R
.align 2
.text 
.thumb

.include "./Source/commands/(GAME_OF_CHOICE).s" 
```

### Building
To build the script, make sure you have your devkitPro set up correctly (you can manually override your path in the config.yml), and just run the Python script in the root folder, passing the "build" argument to it:
> python make_script.py build


### Cleaning
To clean your build folder, just run the Python script in the main folder, passing the "clean" argument to it:
> python make_script.py clean


### Credits:
• [Kaphotics](http://github.com/kwsch) and pichu2001 for documentation on scripting commands.

• [KDSKardabox](http://github.com/KDSKardabox) for writing a system I later adapted for this.
