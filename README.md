# CheapScript
An easier method of writing scripts for the games Pokémon Black 2 and White 2.

### Note:
This system is not perfect, nor is it complete. Hopefully, we can get to a point where I can say otherwise.

## Setup
### Requirements
* devkitARM (from the devkitPro toolchain).
* Python 3 (latest version).

### Decompiling existing script containers:
In order to help people understand the format of Generation 5 scripts, I have written a disassembler to decompile scripts to the format expected by the compiler. This decompiler is far from perfect; it tends to generate files with sizes larger than that of the games, and not all of the commands are implemented/discovered as of now. However, this can be used to comprehend scripts at a basic level.

To invoke the decompiler and save to a file, simply find a script container from the game which you'd like to decompile, then invoke this command:
> python DeCheapScript.py <script container name> > <output destination>.s

If you just want to see the script printed to the console (not necessarily recommended...), omit the `>` operator:
> python DeCheapScript.py <script container name>

### Writing a custom script container:
If editing an existing container isn't your goal, or you just want to start anew, that is indeed possible.
* Create a blank text file in something such as Notepad or Notepad++. Change the extension to `.s`.
* Ensure the following lines are at the top:

```R
.include "commands.s"
.include "movements.s"
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
Header:
  script ExampleScript
  script ExampleScript2
EndHeader

ExampleScript:
  End
ExampleScript2:
  End
...  
```

* You should have something akin to this (but, with the commands you want to be executed):

```R
.include "commands.s"
.include "movements.s"

Header:
  script ExampleScript
  script ExampleScript2
EndHeader

ExampleScript:
  End
ExampleScript2:
  End
```

## Building
To compile a single script container, run the following command in a console:
> python CheapScript.py <script container> <destination>

## Commands
For a list of implemented commands, click the "Wiki" tab. Otherwise, see [this](https://pastebin.com/QPrYmFwY) reference for commands which may not be implemented as of yet.

## Contributors
Want to contribute? That is completely fine by me. All you have to do is submit a pull request.

## Credits:
• [Kaphotics](http://github.com/kwsch) and [pichu2001](https://projectpokemon.org/home/profile/222-pichu2001/) for documentation on scripting commands.

• [recordreader](https://www.youtube.com/channel/UCDwiNjAJ-dlllv9LuUxiS_A) for being a beta tester.
