# CheapScript
This plans to be an easier way of scripting in the DS generation of games, using Assembly macros.

### Example:
In our defines file, we will have something like this:
``` 
.macro Message id npc position type 
.hword 0x3C
.byte 0x0
.byte 0x04
.hword \id
.hword \npc
.hword \position
.hword \type
.endm
```

And in our script file, we will have something like this:
```
.text
.thumb
.include "commands/b2w2.s"

main:
     Message 0x1 0x2 0x0 0x0
```

This will take a little bit of time, as some commands have not been documented.


### Credits:
• Kaphotics and pichu2001 for documentation on scripting commands.

• KDSKardabox for writing a system I later adapted for this.
