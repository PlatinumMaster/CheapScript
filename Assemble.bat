@echo off

cd "Source/"

for %%S in (*.s) do (
	@echo Compiling %%~nS.s...
    C://devkitPro//devkitARM//bin/arm-none-eabi-as -c "%%S" -o "../Obj/%%~nS.o"
    C://devkitPro//devkitARM//bin/arm-none-eabi-objcopy -O binary "../Obj/%%~nS.o" "../Bin/%%~nS.bin"
)

@echo Done.

pause