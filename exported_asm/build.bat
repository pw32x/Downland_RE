set filename=downland

..\..\..\CocoDev\lwtools-mingw64\lwasm %filename%.asm --6809 --list --symbols --output=%filename%.bin --format=raw --symbol-dump=%filename%.sym --map=%filename%.map 