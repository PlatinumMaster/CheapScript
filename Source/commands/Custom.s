@ Custom commands.
@ These commands are not in the game by default, but help with it.

.macro Header Script
.word \Script-4
.endm

.macro EndHeader
.hword 0xFD13
.endm

.macro GetOffset CurrentLabel DestinationLabel
.word \DestinationLabel - \CurrentLabel - 3
.endm