#!/usr/bin/env bash
clear
echo "sudo pacman -Syy --force dialog"
cmd=(dialog --backtitle "Bash Tool, Bash Quick and easy! by ZeroDot1" --menu "Select options:" 22 76 16)

options=(
    1 "Sync Pacman Database"
    2 "Update the System (Pacman)"
    3 "Update the System (Pacaur)"
    4 "Update-Hosts Ad and Malwareblock"
    5 "Install Update-Hosts Ad and Malwareblock"
    6 "Clean pacman cache completely and remove all packages"
    7 "Optimize the pacman database access speed"
    8 "systemctl restart nscd"
    9 "systemctl restart dnsmasq"
    10 "systemctl restart named"
    11 "About Bash Tool"
    12 "Edit /etc/hosts file (Leafpad)"
    13 "NVIDIA Automatic configuration (nvidia-xconfig)"
    14 "ClamAV update the virus definitions"
    15 "ClamAV scan and the system and remove viruses"
    16 "Rankmirrors to Set the Fastest Download Server"
    17 "Initializing the keyring and Verifying the master keys"
    18 "Refresh mirror list (reflector)"
    19 "Turn off the computer"
    20 "Restart the computer"
    21 "Exit :("
    )

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            clear
            tput setaf 2
            echo "Sync Pacman Database"
            sudo pacman -Syy --force
            echo "Done!" ;;
        2)
            clear
            tput setaf 2
            echo "Update the Syststem (Pacman)"
            sudo pacman -Syyu --force
            echo "Done!" ;;
        3)
            clear
            tput setaf 2
            echo "Update the Syststem (Pacaur)"
            pacaur -Syyu --force
            echo "Done!" ;;
        4)
            clear
            tput setaf 2
            echo "Update-Hosts Ad and Malwareblock"
            update-hosts
            echo "Done!" ;;
        5)
            clear
            tput setaf 2
            echo "Install Update-Hosts Ad and Malwareblock"
            pacaur -Syy --force update-hosts
            echo "Done!" ;;
        6)
            clear
            tput setaf 2
            echo "Clean pacman cache completely and remove all packages"
            sudo pacman -Scc
            echo "Done!" ;;
        7)
            clear
            tput setaf 2
            echo "Optimize the pacman database access speed"
            sudo pacman-optimize && sync
            echo "Done!" ;;
        8)
            clear
            tput setaf 2
            echo "systemctl restart nscd"
            systemctl restart nscd ;;
        9)
            clear
            tput setaf 2
            echo "systemctl restart dnsmasq"
            sudo systemctl restart dnsmasq ;;
        10)
            clear
            tput setaf 2
            echo "systemctl restart named"
            sudo systemctl restart named ;;
        11)
            clear
            echo "About Bash Tool"
            dialog --backtitle "Bash Tool, Bash Quick and easy! by ZeroDot1" --title 'About Bash Tool' --msgbox ' Bash Tool, Bash Quick and easy! \n Version 1.0.0.3 \n (c) 2017 by ZeroDot1 \n
 Homepage: https://galaxy-bytes.blogspot.de/ \n Github: https://github.com/ZeroDot1 \n \n Last Update: 22.10.2017 18:36' 15 60
            clear ;;
        12)
            clear
            sudo leafpad  '/etc/hosts' ;;
        13)
            clear
            echo "NVIDIA Automatic configuration (nvidia-xconfig)"
            sudo nvidia-xconfig
            echo "Done!" ;;
        14)
            clear
            echo "ClamAV update the virus definitions"
            sudo freshclam -d
            sudo freshclam
            echo "Done!" ;;
        15)
            clear
            echo "ClamAV scan and the system and remove viruses"
            sudo clamscan -r -v -a --remove / ;;
        16)
            clear
            echo "Rankmirrors to Set the Fastest Download Server"
            cd /etc/pacman.d/
            sudo cp mirrorlist mirrorlist.bak
            rankmirrors -n 6 mirrorlist.bak | sudo tee mirrorlist
            sudo pacman -Syy --force
            echo "Done!" ;;
        17)
            clear
            echo "Initializing the keyring and Verifying the master keys"
            sudo rm /var/lib/pacman/sync/*
            sudo pacman-key --init
            sudo pacman-key --populate archlinux antergos
            sudo pacman-key --refresh-keys
            sudo pacman -Syy --force
            cd $HOME
            echo "Done!" ;;
        18)
            clear
            echo "Refresh mirror list (reflector)"
            reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist
            clear
            echo "Done!" ;;
        19)
            clear
            echo "Turn off the computer"
            poweroff
            clear ;;
        20)
            clear
            echo "Restart the computer"
            reboot
            clear ;;
        21)
            clear
            echo "Exit :("
            exit 0
            clear ;;
    esac
done
