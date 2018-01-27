@ Custom commands.
@ These commands are not in the game by default, but help with the assembler.

.macro GetDist CurrentLabel DestinationLabel
.word \DestinationLabel - \CurrentLabel - 3
.endm