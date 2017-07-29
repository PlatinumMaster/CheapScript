# CheapScript

This plans to be an easier way of scripting in the DS generation of games, using Assembly mscros.

###Example:
In our defines file, we will have something like this:

> .macro Message id npc position type
.hword 0x3C
.byte 0x0
.byte 0x04
.hword \id
.hword \npc
.hword \position
.hword \type
.endm

And in our script file, we will have something like this:

> .text
.thumb

main:
        Message 0x1 0x2 0x0 0x0
