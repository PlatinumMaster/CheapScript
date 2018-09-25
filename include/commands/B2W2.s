@ Scripting Macros for Pokémon Black 2 Version and White 2 Version
@ Original Reference by Kaphotics. http://pastebin.com/raw/vrkp0SN8

@ Header 
.macro script, adr=0
.word  \adr - 1f
1:
.endm

.macro EndHeader
.hword 0xFD13
.endm

@ Conditions
.equ Condition_LowerThan, 0
.equ Condition_EqualTo, 1
.equ Condition_GreaterThan, 2
.equ Condition_LowerThanorEqualTo, 3
.equ Condition_GreaterThanorEqualTo, 4

@ Commands
.macro End
.hword 0x02
.endm

.macro ReturnAfterDelay arg
.hword 0x03
.hword \arg
.endm

.macro CallRoutine arg
.hword 0x04
.word \arg-4
.endm

.macro EndFunction arg
.hword 0x05
.hword \arg
.endm

.macro Logic06 arg
.hword 0x06
.hword \arg
.endm

.macro Logic07 arg
.hword 0x07
.hword \arg
.endm

.macro CompareTo value
.hword 0x08
.hword \value
.endm

.macro StoreVar var
.hword 0x09
.hword \var
.endm

.macro ClearVar var
.hword 0x0A
.hword \var
.endm

.macro Unknown_0B value
.hword 0x0B
.hword \value
.endm

.macro Unknown_0C value
.hword 0x0C
.hword \value
.endm

.macro Unknown_0D value
.hword 0x0D
.hword \value
.endm

.macro Unknown_0E value
.hword 0x0E
.hword \value
.endm

.macro Unknown_0F value
.hword 0x0F
.hword \value
.endm

.macro StoreFlag value
.hword 0x10
.hword \value
.endm

.macro Condition condition
.hword 0x11
.hword \condition
.endm

.macro Unknown_12 value
.hword 0x12
.hword \value
.endm

.macro Unknown_13 value1 value2
.hword 0x13
.hword \value1
.hword \value2
.endm

.macro Unknown_14 value
.hword 0x14
.hword \value
.endm

.macro Unknown_16 value
.hword 0x16
.hword \value
.endm

.macro Unknown_17 value
.hword 0x17
.hword \value
.endm

.macro Compare value1 value2
.hword 0x19
.hword \value1
.hword \value2
.endm

.macro CallStd function
.hword 0x1C
.hword \function
.endm

.macro ReturnStd function
.hword 0x1D
.endm

.macro Jump offset
.hword 0x1E
.word \offset-1f
1:
.endm

.macro If value Jump offset
.hword 0x1F
.byte \value
.word   \offset - 1f
1:
.endm

.macro Unknown_21 value
.hword 0x21
.hword \value
.endm

.macro Unknown_22 value
.hword 0x22
.hword \value
.endm

.macro SetFlag flag
.hword 0x23
.hword \value
.endm

.macro ClearFlag flag
.hword 0x24
.hword \flag
.endm

.macro SetVarFlagStatus flag status
.hword 0x25
.hword \flag
.hword \status
.endm

.macro SetVar26 value1 value2
.hword 0x26
.hword \value1
.hword \value2
.endm

.macro SetVar27 value1 value2
.hword 0x27
.hword \value1
.hword \value2
.endm

.macro SetVarEqVal container value
.hword 0x28
.hword \container
.hword \value
.endm

.macro SetVar29 container value
.hword 0x29
.hword \container
.hword \value
.endm

.macro SetVar2A container value
.hword 0x2A
.hword \container
.hword \value
.endm

.macro SetVar2B value
.hword 0x2B
.hword \value
.endm

.macro Unknown_2D value
.hword 0x2D
.hword \value
.endm

.macro LockAll
.hword 0x2E
.endm

.macro UnlockAll
.hword 0x2F
.endm

.macro WaitMoment
.hword 0x30
.endm

.macro WaitButton
.hword 0x32
.endm

.macro MusicalMessage id
.hword 0x33
.hword \id
.endm

.macro EventGreyMessage id location
.hword 0x34
.hword \id
.byte \location
.endm

.macro CloseMusicalMessage
.hword 0x35
.endm

.macro ClosedEventGreyMessage
.hword 0x36
.endm

.macro BubbleMessage id location
.hword 0x38
.hword \id
.byte \location
.endm

.macro CloseBubbleMessage
.hword 0x39
.endm

.macro ShowMessageAt id xcoord ycoord zcoord
.hword 0x3A
.hword \id
.hword \xcoord
.hword \ycoord
.hword \zcoord
.endm

.macro CloseShowMessageAt
.hword 0x3B
.endm

.macro Message id npc position type
.hword 0x3C
.byte 0x0
.byte 0x04
.hword \id
.hword \npc
.hword \position
.hword \type
.endm

.macro Message2 id npc position type
.hword 0x3D
.byte 0x0
.byte 0x04
.hword \id
.hword \npc
.hword \position
.hword \type
.endm

.macro CloseMessageKP
.hword 0x3E
.endm

.macro CloseMessageKP2
.hword 0x3F
.endm

.macro MoneyBox xcoord ycoord
.hword 0x40
.hword \xcoord
.hword \ycoord
.endm

.macro CloseMoneyBox
.hword 0x41
.endm

.macro UpdateMoneyBox
.hword 0x42
.endm

.macro BorderedMessage id color
.hword 0x43
.hword \id
.hword \color
.endm

.macro CloseBorderedMessage
.hword 0x44
.endm

.macro PaperMessage id transcoord
.hword 0x45
.hword \id
.hword \transcoord
.endm

.macro ClosePaperMessage
.hword 0x46
.endm

.macro YesNo yesno
.hword 0x47
.hword \yesno
.endm

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

.macro SetVarPoke arg poke
.hword 0x57
.byte \arg
.hword \poke
.endm

.macro SetVarPoke2 arg poke
.hword 0x58
.byte \arg
.hword \poke
.endm

.macro SetVarLocation arg location
.hword 0x59
.byte \arg
.hword \location
.endm

.macro SetVarPokeNick arg poke
.hword 0x5A
.byte \arg
.hword \poke
.endm

.macro SetVar_Unknown2 arg value
.hword 0x5B
.byte \arg
.hword \value
.endm

.macro SetVarStoreValue5C arg container stat
.hword 0x5C
.byte \arg
.hword \container
.hword \stat
.endm

.macro SetVarMusicalInfo arg value
.hword 0x5D
.hword \arg
.hword \value
.endm

.macro SetVarNations arg value
.hword 0x5E
.byte \arg
.hword \value
.endm

.macro SetVarActivities arg value
.hword 0x5F
.byte \arg
.hword \value
.endm

.macro SetVarPower arg value
.hword 0x60
.byte \arg
.hword \value
.endm

.macro SetVarTrainerType arg value
.hword 0x61
.byte \arg
.hword \value
.endm

.macro SetVarTrainerType2 arg value
.hword 0x62
.byte \arg
.hword \value
.endm

.macro SetVarGeneralWord arg value
.hword 0x63
.byte \arg
.hword \value
.endm

.macro ApplyMovement npc movementdata
.hword 0x64
.hword \npc
.word   \movementdata - 1f
1:
.endm

.macro WaitMovement
.hword 0x65
.endm

.macro StoreHeroPosition xcoord ycoord
.hword 0x66
.hword \xcoord
.hword \ycoord
.endm

.macro Unknown_67 value value2
.hword 0x67
.hword \value
.hword \value2
.endm

.macro StoreHeroPosition2 xcoord ycoord
.hword 0x68
.hword \xcoord
.hword \ycoord
.endm

.macro StoreNPCPosition npc xcoord ycoord
.hword 0x69 
.hword \npc
.hword \xcoord
.hword \ycoord
.endm

.macro Unknown_6A npc flag
.hword 0x6A
.hword \npc
.hword \flag
.endm

.macro AddNPC npc
.hword 0x6B
.hword \npc
.endm

.macro RemoveNPC npc
.hword 0x6C
.hword \npc
.endm

.macro SetOWPosition npc xcoord ycoord zcoord direction
.hword 0x6D
.hword \npc
.hword \xcoord
.hword \ycoord
.hword \zcoord
.hword \direction
.endm

.macro Unknown_6E arg
.hword 0x6E
.hword \arg
.endm

.macro Unknown_6F arg
.hword 0x6F
.hword \arg
.endm

.macro Unknown_70 arg arg2 arg3 arg4 arg5
.hword 0x70
.hword \arg
.hword \arg2
.hword \arg3
.hword \arg4
.hword \arg5
.endm

.macro Unknown_71 arg arg2 arg3 
.hword 0x71
.hword \arg
.hword \arg2
.hword \arg3
.endm

.macro Unknown_72 arg arg2 arg3 arg4
.hword 0x72
.hword \arg
.hword \arg2
.hword \arg3
.hword \arg4
.endm

.macro Unknown_73 arg arg2
.hword 0x73
.hword \arg
.hword \arg2
.endm

.macro FacePlayer
.hword 0x74
.endm

.macro Release npc
.hword 0x75
.hword \npc
.endm

.macro ReleaseAll
.hword 0x76
.endm

.macro Lock npc
.hword 0x77
.hword \npc
.endm

.macro Unknown_78 var
.hword 0x78
.hword \var
.endm

.macro Unknown_79 npc arg2 arg3
.hword 0x79
.hword \npc
.hword \arg2
.hword \arg3
.endm

.macro MoveNPCTo npc xcoord ycoord zcoord
.hword 0x7B
.hword \npc
.hword \xcoord
.hword \ycoord
.hword \zcoord
.endm

.macro Unknown_7C arg arg2 arg3 arg4
.hword 0x7C
.hword \arg
.hword \arg2
.hword \arg3
.hword \arg4
.endm

.macro Unknown_7D arg arg2 arg3 arg4
.hword 0x7D
.hword \arg
.hword \arg2
.hword \arg3
.hword \arg4
.endm

.macro TeleportUpNPC npc
.hword 0x7E
.hword \npc
.endm

.macro Unknown_7F arg arg2
.hword 0x7F
.hword \arg
.hword \arg2
.endm

.macro Unknown_80 arg
.hword 0x80
.hword \arg
.endm

.macro Unknown_81
.hword 0x81
.endm

.macro Unknown_82 arg arg2
.hword 0x82
.hword \arg
.hword \arg2
.endm

.macro SetVar83 value
.hword 0x83
.hword \value
.endm

.macro SetVar84 value
.hword 0x84
.hword \value
.endm

.macro SingleTrainerBattle trainerid trainerid2 logic
.hword 0x85
.hword \trainerid
.hword \trainerid2
.hword \logic
.endm

.macro DoubleTrainerBattle ally trainerid trainerid2 logic
.hword 0x86
.hword \ally
.hword \trainerid
.hword \trainerid2
.hword \logic
.endm

.macro Unknown_87 arg arg2 arg3
.hword 0x87
.hword \arg
.hword \arg2
.hword \arg3
.endm

.macro Unknown_88 arg arg2 arg3
.hword 0x88
.hword \arg
.hword \arg2
.hword \arg3
.endm

.macro Unknown_8A arg arg2
.hword 0x8A
.hword \arg
.hword \arg2
.endm

.macro PlayTrainerMusic songid
.hword 0x8B
.hword \songid
.endm

.macro EndBattle 
.hword 0x8C
.endm

.macro StoreBattleResult variable
.hword 0x8D 
.hword \variable
.endm

.macro DisableTrainer
.hword 0x8E
.endm

.macro DVar90 arg arg2
.hword 0x90
.hword \arg
.hword \arg2
.endm

.macro DVar92 arg arg2
.hword 0x92
.hword \arg
.hword \arg2
.endm

.macro DVar93 arg arg2
.hword 0x93
.hword \arg
.hword \arg2
.endm

.macro TrainerBattle trainerid arg2 arg3 arg4
.hword 0x94 
.hword \trainerid
.hword \arg2
.hword \arg3
.hword \arg4
.endm

.macro DeactivateTrainerID id
.hword 0x95
.hword \id
.endm

.macro Unknown_96 trainerid
.hword 0x96
.hword \trainerid
.endm

.macro StoreActiveTrainerID trainerid arg2
.hword 0x97
.hword \trainerid
.hword \arg2
.endm

.macro ChangeMusic songid
.hword 0x98
.hword \songid
.endm

.macro FadeToDefaultMusic
.hword 0x9E
.endm

.macro Unknown_9F
.hword 0x9F
.endm

.macro Unknown_A2 sound arg2
.hword 0xA2
.hword \sound
.hword \arg2
.endm

.macro Unknown_A3 arg
.hword 0xA3
.hword \arg
.endm

.macro Unknown_A4 arg
.hword 0xA4
.hword \arg
.endm

.macro Unknown_A5 arg arg2
.hword 0xA5
.hword \arg
.hword \arg2
.endm

.macro PlaySound id
.hword 0xA6
.hword \id
.endm

.macro WaitSoundA7
.hword 0xA7
.endm

.macro WaitSound
.hword 0xA8
.endm

.macro PlayFanfare id
.hword 0xA9
.hword \id
.endm

.macro WaitFanfare
.hword 0xAA
.endm

.macro PlayCry id arg2
.hword 0xAB
.hword \id
.hword \arg2
.endm

.macro WaitCry 
.hword 0xAC
.endm

.macro SetTextScriptMessage id arg2 arg3
.hword 0xAF
.hword \id
.hword \arg2
.hword \arg3
.endm

.macro CloseMulti
.hword 0xB0
.endm

.macro Unknown_B1
.hword 0xB1
.endm

.macro Multi2 arg arg2 arg3 arg4 arg5 var
.hword 0xB2
.byte \arg
.byte \arg2
.byte \arg3
.byte \arg4
.byte \arg5
.hword \var
.endm

.macro FadeScreen arg arg2 arg3 arg4
.hword 0xB3
.hword \arg
.hword \arg2
.hword \arg3
.hword \arg4
.endm

.macro ResetScreen arg arg2 arg3
.hword 0xB4
.hword \arg
.hword \arg2
.hword \arg3
.endm

.macro Screen_B5 arg arg2 arg3
.hword 0xB5
.hword \arg
.hword \arg2
.hword \arg3
.endm

.macro TakeItem item quantity result
.hword 0xB6
.hword \item
.hword \quantity
.hword \result
.endm

.macro CheckItemBagSpace item quantity result
.hword 0xB7
.hword \item
.hword \minimumquantity
.hword \result
.endm

.macro CheckItemBagNumber item minimumquantity result
.hword 0xB8
.hword \item
.hword \result
.endm

.macro StoreItemCount item result
.hword 0xB9
.hword \item
.hword \result
.endm

.macro Unknown_BA arg arg2 arg3 arg4
.hword 0xBA
.hword \arg
.hword \arg2
.hword \arg3
.hword \arg4
.endm

.macro Unknown_BB arg arg2
.hword 0xBB
.hword \arg
.hword \arg2
.endm

.macro Unknown_BC arg
.hword 0xBC
.hword \arg
.endm

.macro Warp mapid xcoord ycoord
.hword 0xBE
.hword \mapid
.hword \xcoord
.hword \ycoord
.endm

.macro TeleportWarp mapid xcoord ycoord zcoord
.hword 0xBF
.hword \mapid
.hword \xcoord
.hword \ycoord
.hword \zcoord
.endm

.macro FallWarp mapid xcoord ycoord
.hword 0xC1
.hword \mapid
.hword \xcoord
.hword \ycoord
.endm

.macro FastWarp mapid xcoord ycoord herofacing
.hword 0xC2
.hword \mapid
.hword \xcoord
.hword \ycoord
.hword \herofacing
.endm

.macro UnionWarp 
.hword 0xC3
.endm

.macro TeleportWarp2 mapid xcoord ycoord zcoord herofacing
.hword 0xC4
.hword \mapid
.hword \xcoord
.hword \ycoord
.hword \zcoord
.hword \herofacing
.endm

.macro SurfAnimation
.hword 0xC5
.endm

.macro SpecialAnimation arg
.hword 0xC6
.hword \arg
.endm

.macro SpecialAnimation2 arg arg2
.hword 0xC7
.hword \arg
.hword \arg2
.endm

.macro CallAnimation id arg2
.hword 0xC8
.hword \arg
.hword \arg2
.endm

.macro StoreRandomNumber arg arg2
.hword 0xCB
.hword \arg
.hword \arg2
.endm

.macro StoreVarItem arg 
.hword 0xCC
.hword \arg
.endm

.macro StoreVar_CD arg 
.hword 0xCD
.hword \arg
.endm

.macro StoreVar_CE arg 
.hword 0xCE
.hword \arg
.endm

.macro StoreVar_CF arg 
.hword 0xCF
.hword \arg
.endm

.macro StoreDate month date
.hword 0xD0
.hword \month
.hword \date
.endm

.macro Store_D1 arg arg2
.hword 0xD1
.hword \arg
.hword \arg2
.endm

.macro Store_D2 arg arg2
.hword 0xD2
.hword \arg
.endm

.macro Store_D3 arg arg2
.hword 0xD3
.hword \arg
.endm

.macro StoreBirthDay month day
.hword 0xD4
.hword \month
.hword \day
.endm

.macro StoreBadge var badge
.hword 0xD5
.hword \var
.hword \badge
.endm

.macro SetBadge badge
.hword 0xD6
.hword \badge
.endm

.macro StoreBadgeNumber badge
.hword 0xD7
.hword \badge
.endm

.macro BootPCSound
.hword 0x130
.endm
