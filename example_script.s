@ Example Script, demonstrating the use of macros for scripting in Pokémon.

.text @ This should be in every script file you make, regardless of game.
.thumb @ This should be in every script file you make, regardless of game.

.include "commands/B2W2.s" @ This should be in every script file you make for the games "Pokémon Black 2 and White 2". 
@ Remember, you can change the "B2W2" to match the game of choice.

Main: 
                LockAll @ Freezes all objects on the map.
                FacePlayer @ Turns the NPC with the script assigned towards the player.
                PlaySound 0x547 @ Plays the "clink".
                Message 0x0 0x0 0x0 0x0 @ Opens a normal message box at the bottom of the screen, prints the first message in a text file to that box, and has the bubble point to the first NPC on the map.
                YesNoBox 0x8010 @ Opens a YesNoBox, the result is put into 0x8010.
                StoreVar 0x8010 @ Stores 0x8010 as a variable.
                CompareTo 0x0 @ Compares 0x0 to 0x8010.
                Condition 0x1 @ Conditional statement.
                If 0x1 StartTrainerBattle @ If 0x8010's value is 0x1, jump to the offset of StartTrainerBattle.

StartTrainerBattle:
                Message 0x0 0x0 0x0 0x0 @ Again, opens a normal message box at the bottom of the screen, prints the first message in a text file to that box, and has the bubble point to the first NPC on the map.
                TrainerBattleVs1 0x9D 0x0 @ Start a trainer battle with trainer 157.
                Release @ Allow all NPCs to move again.