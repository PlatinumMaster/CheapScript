.macro Message3 id npc position type unknown
.hword 0x48
.byte 0x0
.byte 0x04
.hword \id
.hword \npc
.hword \position
.hword \type
.hword \unknown
.endm

.macro DoubleMessage idblack idwhite npc position type
.hword 0x49
.byte 0x0
.byte 0x04
.hword \idblack
.hword \idwhite
.hword \npc
.hword \position
.hword \type
.endm

.macro AngryMessage id unknownbyte position
.hword 0x4A
.hword \id
.byte \unknownbyte
.hword \position
.endm

.macro CloseAngryMessage
.hword 0x4B
.endm

.macro SetVarHero arg
.hword 0x4C
.byte \arg
.endm

.macro SetVarItem arg item
.hword 0x4D
.byte \arg
.hword \item
.endm

.macro unknown_4E arg1 arg2 arg3 arg4
.hword 0x4E
.byte \arg1
.hword \arg2
.hword \arg3
.byte \arg4
.endm

.macro SetVarItem2 arg item
.hword 0x4F
.byte \arg
.hword \item
.endm

.macro SetVarItem3 arg item
.hword 0x50
.byte \arg
.hword \item
.endm

.macro SetVarMove arg move
.hword 0x51
.byte \arg
.hword \move
.endm

.macro SetVarBag arg item
.hword 0x52
.byte \arg
.hword \item
.endm

.macro SetVarPartyPoke arg party_poke
.hword 0x53
.byte \arg
.hword \party_poke
.endm

.macro SetVarPartyPoke2 arg party_poke2
.hword 0x54
.byte \arg
.hword \party_poke
.endm

.macro SetVar_Unknown arg value
.hword 0x55
.byte \arg
.hword \value
.endm

.macro SetVarType arg type
.hword 0x56
.byte \arg
.hword \type
.endm

