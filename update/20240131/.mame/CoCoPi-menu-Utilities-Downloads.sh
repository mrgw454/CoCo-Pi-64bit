    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt) $(cat $HOME/rpi-model.txt)" \
    --menu "\nPlease select from the following:" 18 70 10 \
    "1"  "System Status" \
    "2" "Download  ROM images to /media/share1/roms" \
    "3" "Download  Latest Fuzix Nightly image" \
    "4" "Download  Latest NitrOS9 EOU image" \
    "5" "Download  Latest UltimateSDC image" \
    "6" "Download  AGD Games (Pierre Serrat)" \
    "7" "Update    Jim Gerrie's MC-10 git repo" \
    "8" "Update    Giant HDD image for CoCo" \
    "9" "Update    Ron Delvaux's Picture Gallery" \
    "10" "Update    Michael Furman's EOU IDE git repo" \
    "11" "Update    Jim Gerrie's EOU Testing git repo" \
    "12" "Update    Jim Gerrie's JGGAMES git repo" \
    "13" "Reboot    Raspberry Pi" \
    "14" "Shutdown  Raspberry Pi" \
    "15" "Return to Utilities Menu" \
    "16" "Return to Main Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) status.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        2) downloadROMs.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        3) downloadFuzixNightly.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        4) downloadNitrOS9EOU.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        5) downloadUltimateSDC.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        6) downloadAGDGames.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        7) updateJIMG.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        8) updateCCHDD.sh && CoCoPi-menu-Utilities-Downloads.sh;;
        9) updateRonD.sh && CoCoPi-menu-Utilities-Downloads.sh;;
       10) updateEOU-IDE.sh && CoCoPi-menu-Utilities-Downloads.sh;;
       11) downloadJimGOS9.sh && CoCoPi-menu-Utilities-Downloads.sh;;
       12) downloadJGGAMES.sh && CoCoPi-menu-Utilities-Downloads.sh;;
       13) rebootRPi.sh;;
       14) shutdownRPi.sh;;
       15) CoCoPi-menu-Utilities.sh;;
       16) menu;;
        *) echo "Quitting...";;
    esac
