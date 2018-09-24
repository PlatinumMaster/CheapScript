# CheapScript
This plans to be an easier way of scripting in the DS generation of games, using Assembly macros.

### Note:
This system currently only has definitions of a few commands from Pokémon Black 2 and White 2. Other games should be supported in the future.

## Setup
### Requirements
* devkitPro (r47 is the recommended version).
* Python 3.5 or above.

### Building
To build the script, make sure you have your devkitPro set up correctly (you can manually override your path in the make_script.py), and just run the Python script in the root folder, passing the "build" argument to it:
> python make_script.py build


### Cleaning
To clean your build folder, just run the Python script in the main folder, passing the "clean" argument to it:
> python make_script.py clean

### Making a script:
As shown in the "example_script.s", you must have the the following lines (replacing "GAME_OF_CHOICE" with your game of choice; e.g B2W2):
```R
.align 2
.text 
.thumb

.include "include/commands/(GAME_OF_CHOICE).s" 
```

Under that, we will point to the main starting point of our script(s) in the header section. So if the script label is called `Example`, I'd point to it like this:
```
@ Point to your script here.
Header:
	script Example
	EndHeader
```
And then, writing the script is as simple as this:
```
Example:
	@ Script commands go here.
```
From there, you can begin to write your script. An example script cam be found in the `scripts` folder.

### Commands:
For a list of implemented commands, click the "Wiki" tab.


### Credits:
• [Kaphotics](http://github.com/kwsch) and [pichu2001](https://projectpokemon.org/home/profile/222-pichu2001/) for documentation on scripting commands.

• [KDSKardabox](http://github.com/KDSKardabox) for writing a system I later adapted for this.
