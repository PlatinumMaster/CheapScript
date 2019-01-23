# CheapScript
This plans to be an easier way of scripting in the DS generation of games, using Assembly macros.

### Note:
This system currently only has definitions of a few commands from Pokémon Black 2 and White 2. Other games should be supported in the future.

## Setup
### Requirements
* devkitARM (r47 is the recommended version).
* Python 3.5 or above.

### Writing a script container:
* Create a blank text file in something such as Notepad or Notepad++. Change the extension to `.s`.
* Copy the following lines to it (replacing "GAME_OF_CHOICE" with your game of choice; e.g B2W2):
```R
.align 2
.include "(GAME_OF_CHOICE).s"
```

* Now, due to the way the DS generation scripts work, you now have to create the header section (which points to the starts of the scripts).

* Make a label for each of the scripts you are writing (the first part which will be executed when the script is called) under the header:
```R
ExampleScript:
  End
ExampleScript2:
  End
...
```
* For each script (again, the part which is executed when you first call the script), you must add a corresponding entry in the header section. Before the declaration of any labels (i.e ExampleScript in my example), you must write these entries, and then end the header section with EndHeader. Like this:
```R
...
script ExampleScript
script ExampleScript2
EndHeader

ExampleScript:
  End
ExampleScript2:
  End
...  
```

* This leaves the entire thing looking like this:
```R
.align 2
.include "(GAME_OF_CHOICE).s"

script ExampleScript
script ExampleScript2
EndHeader

ExampleScript:
  End
ExampleScript2:
  End
```

* Now, start writing your scripts under the labels you made.

### Building
To compile a single script container, just drag and drop a script container onto "CheapScript.py", or run the following command in a console:
> python CheapScript.py <script container>

To compile a folder filled with script containers, just drag and drop the folder onto "CheapScript.py", or run the following command in a console:
> python CheapScript.py <script container folder>

### Commands:
For a list of commands, click the "Wiki" tab.


### Credits:
• [Kaphotics](http://github.com/kwsch) and [pichu2001](https://projectpokemon.org/home/profile/222-pichu2001/) for documentation on scripting commands.

• [KDSKardabox](http://github.com/KDSKardabox) for writing the original system I later adapted for this.
