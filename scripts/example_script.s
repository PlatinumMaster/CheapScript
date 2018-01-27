@ Example Script, demonstrating the use of macros for scripting in Pokémon.

.align 2
.text 
.thumb

.include "include/commands/B2W2.s" 
.include "include/commands/Custom.s" 

Main: 
		PlaySound 0x547
		Message2 0x0 0x0 0x0 0x0 
		YesNo 0x8010
		WaitButton				
		StoreVar 0x8010
		CompareTo 0x0
		Condition 0x1
				
Conditional:
		If 0x1 StartTrainerBattle-Conditional-3
		Message 0x0 0x0 0x0 0x0
		WaitButton
		End

StartTrainerBattle:
		PlaySound 0x573
		AngryMessage 0x0 0x0 0x0 
		WaitButton
		CloseAngryMessage
		TrainerBattle 0x9D 0x9E 0x0
		End @ Ends the script.
