@ Example Script, demonstrating the use of macros for scripting in Pokémon.

.align 2
.text 
.thumb

.include "include/commands/B2W2.s" 


@ Point to your script here.
Header:
	script Main
	EndHeader
	
@ Actual script
Main: 
	PlaySound 1351
	Message2 0 0 0 0
	YesNo 0x8010
	WaitButton	
	CloseMessageKP
	StoreVar 0x8010
	CompareTo 0
	Condition Condition_EqualTo
	If Condition_EqualTo Jump Main_StartTrainerBattle
	Message 0 0 0 0
	WaitButton
	End
	
@ Branch of the original script
Main_StartTrainerBattle:
	PlaySound 1395
	AngryMessage 0 0 0
	WaitButton
	CloseAngryMessage
	TrainerBattle 157 0 0
	End @ Ends the script.
