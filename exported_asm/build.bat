set filename=downland
set lwasm=..\..\..\CocoDev\lwtools-mingw64\lwasm

REM %lwasm% %filename%.asm --6809 --list=%filename%.listing.txt --symbols --output=%filename%.bin --format=raw --symbol-dump=%filename%.sym --map=%filename%.map 

%lwasm% %filename%.asm --6809 --output=%filename%.bin --format=raw 