#!/bin/bash

# add this as a GOTO type function
#cat >/dev/null <<GOTO_1

# assemblers disassemblers
./make-lwtools.sh
#read -p "Press any key to continue... " -n1 -s
./make-asm6809.sh
#read -p "Press any key to continue... " -n1 -s
./make-binutils-gdb.sh
#read -p "Press any key to continue... " -n1 -s
./make-6809dasm.sh
#read -p "Press any key to continue... " -n1 -s
./make-f9dasm.sh
#read -p "Press any key to continue... " -n1 -s
./make-dasm.sh
#read -p "Press any key to continue... " -n1 -s
./make-A09.sh
#read -p "Press any key to continue... " -n1 -s
./make-motorola-6800-assembler.sh
#read -p "Press any key to continue... " -n1 -s
./make-naken-asm.sh
#read -p "Press any key to continue... " -n1 -s

# file system tools
./make-toolshed.sh
#read -p "Press any key to continue... " -n1 -s
./make-bin2cas.sh
#read -p "Press any key to continue... " -n1 -s
./make-cas2wav.sh
#read -p "Press any key to continue... " -n1 -s
./make-conv-tools.sh
#read -p "Press any key to continue... " -n1 -s
./make-cocofs.sh
#read -p "Press any key to continue... " -n1 -s
./make-file2dsk.sh
#read -p "Press any key to continue... " -n1 -s

# C compilers
./make-gcc6809.sh
#read -p "Press any key to continue... " -n1 -s
./make-CMOC.sh
#read -p "Press any key to continue... " -n1 -s
./make-vbcc.sh
#read -p "Press any key to continue... " -n1 -s

# BASIC tools
./make-basic_utils.beta.sh
#read -p "Press any key to continue... " -n1 -s
./make-decb-tools.sh
#read -p "Press any key to continue... " -n1 -s

# compression utilties
./make-dzip.sh
#read -p "Press any key to continue... " -n1 -s
./make-lzsa.sh
#read -p "Press any key to continue... " -n1 -s
./make-mlbr.sh
#read -p "Press any key to continue... " -n1 -s

# bios rom files
./make-coco_roms.sh
#read -p "Press any key to continue... " -n1 -s

# mc-10
./make-CC6303.sh
#read -p "Press any key to continue... " -n1 -s
./make-mcbasic.sh
#read -p "Press any key to continue... " -n1 -s
./make-tasm6801.sh
#read -p "Press any key to continue... " -n1 -s
./make-trs-mc10.sh
#read -p "Press any key to continue... " -n1 -s

# BASIC compilers
./make-fbc.sh
#read -p "Press any key to continue... " -n1 -s
./make-qb64.sh
#read -p "Press any key to continue... " -n1 -s
./make-ugBasic-beta.sh
#read -p "Press any key to continue... " -n1 -s
./make-ugBasic.sh
#read -p "Press any key to continue... " -n1 -s
./make-Squanchy-BASIC.sh
#read -p "Press any key to continue... " -n1 -s

# development librarires
./make-CROSSLIB.sh
#read -p "Press any key to continue... " -n1 -s
./make-dynosprite.sh
#read -p "Press any key to continue... " -n1 -s

# IDE editor
./make-geany.sh
#read -p "Press any key to continue... " -n1 -s
./make-sgeditremix.sh
#read -p "Press any key to continue... " -n1 -s
./make-nanorc.sh
#read -p "Press any key to continue... " -n1 -s
./make-basic_renumber.sh
#read -p "Press any key to continue... " -n1 -s

# storage emulators
./make-DriveWire.sh
#read -p "Press any key to continue... " -n1 -s
./make-pyDriveWire.sh
#read -p "Press any key to continue... " -n1 -s
./make-dload_server.sh
#read -p "Press any key to continue... " -n1 -s
./make-tnfsd.sh
#read -p "Press any key to continue... " -n1 -s
./make-lwwire.sh
#read -p "Press any key to continue... " -n1 -s
./make-tcpser.sh
#read -p "Press any key to continue... " -n1 -s

# terminal programs
./make-DwTermMc10.sh
#read -p "Press any key to continue... " -n1 -s
./make-DwTerm.sh
#read -p "Press any key to continue... " -n1 -s
./make-platotermCoCo.sh
#read -p "Press any key to continue... " -n1 -s

# emulators
./make-xroar.sh
#read -p "Press any key to continue... " -n1 -s
./make-trs80gp.sh
#read -p "Press any key to continue... " -n1 -s
./make-libagar.sh
#read -p "Press any key to continue... " -n1 -s
./make-ovcc.sh
#read -p "Press any key to continue... " -n1 -s
./make-sim6809.sh
#read -p "Press any key to continue... " -n1 -s
./make-mc-10.sh
#read -p "Press any key to continue... " -n1 -s
./make-dosbox.sh
#read -p "Press any key to continue... " -n1 -s
./make-RunCPM.sh
#read -p "Press any key to continue... " -n1 -s
# ./make-mame.sh

# floppy tools
./make-flashfloppy.sh
#read -p "Press any key to continue... " -n1 -s
./make-greaseweazle.sh
#read -p "Press any key to continue... " -n1 -s
./make-hxcfloppyemulator.sh
#read -p "Press any key to continue... " -n1 -s

# other apps
./make-Image2CoCo3.sh
#read -p "Press any key to continue... " -n1 -s
./make-vgmplay.sh
#read -p "Press any key to continue... " -n1 -s


# add this GOTO tag to match command above
#GOTO_1


# CoCo games
./make-3dMonsterMaze.sh
#read -p "Press any key to continue... " -n1 -s
./make-CoCo-Flood-It.sh
#read -p "Press any key to continue... " -n1 -s
./make-cocole.sh
#read -p "Press any key to continue... " -n1 -s
./make-CoCoWumpus.sh
#read -p "Press any key to continue... " -n1 -s
./make-templeofrom.sh
#read -p "Press any key to continue... " -n1 -s

# CoCo diagnostics utilities
./make-bogomips.sh
#read -p "Press any key to continue... " -n1 -s
./make-chart.sh
#read -p "Press any key to continue... " -n1 -s
./make-CoCo3_MemTest2023.sh
#read -p "Press any key to continue... " -n1 -s
./make-cocorx.sh
#read -p "Press any key to continue... " -n1 -s
./make-coremark.sh
#read -p "Press any key to continue... " -n1 -s
./make-gime-mmutest.sh
#read -p "Press any key to continue... " -n1 -s
./make-HiRes-Interface-Test.sh
#read -p "Press any key to continue... " -n1 -s
./make-cocostress.sh
#read -p "Press any key to continue... " -n1 -s

# NitrOS9
#./make-nitros9-code.sh
#read -p "Press any key to continue... " -n1 -s
#./make-nitros9.sh
#read -p "Press any key to continue... " -n1 -s
#./make-cmoc_os9.sh
#read -p "Press any key to continue... " -n1 -s


#./make-rpi-clone.sh
#read -p "Press any key to continue... " -n1 -s

#./make-fip.sh
#./make-FUZIX-coco3.sh

echo
echo Done!
echo
