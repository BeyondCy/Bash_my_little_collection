#!/usr/bin/env bash
clear
echo "sudo pacman -Syy --force dialog"
cmd=(dialog --backtitle "Bash Tool, Bash Quick and easy! by ZeroDot1" --menu "Select options:" 22 76 16)

options=(
    1 "Sync Pacman Database (Pacman)"
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
    16 "Rankmirrors to Set the Fastest Download Server (Wget HTTPS Only)"
    17 "Initializing the keyring and Verifying the master keys"
    18 "Refresh mirror list (reflector)"
    19 "Turn off the computer"
    20 "Restart the computer"
    21 "Optimizing Linux for Slow Computers"
    22 "Change User Password"
    23 "Edit /etc/resolv.conf file (Leafpad)"
    24 "Install Pi-hole (curl)"
    25 "Exit :("
    )

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            clear
            tput setaf 2
            echo "Sync Pacman Database (Pacman)"
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
            pacaur -Syy --force update-hosts-git
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
            dialog --backtitle "Bash Tool, Bash Quick and easy! by ZeroDot1" --title 'About Bash Tool' --msgbox ' Bash Tool, Bash Quick and easy! \n Version 1.0.1.0 \n (c) 2017 by ZeroDot1 \n
 Homepage: https://galaxy-bytes.blogspot.de/ \n Github: https://github.com/ZeroDot1 \n \n Last Update: 21.11.2017 20:54' 15 60
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
            sudo rm -rf '/var/lib/clamav/mirrors.dat'
            sudo freshclam -v -d
            sudo freshclam
            echo "Done!" ;;
        15)
            clear
            echo "ClamAV scan and the system and remove viruses"
            sudo clamscan -r -v -a --remove / ;;
        16)
            clear
            echo "Rankmirrors to Set the Fastest Download Server (Wget HTTPS Only)"
            cd /etc/pacman.d/
            sudo rm -rf /etc/pacman.d/mirrorlist.bak
            sudo rm -rf '/etc/pacman.d/index.html'
            sudo wget --verbose --referer=https://archlinux.org/ -t 20 --no-check-certificate https://www.archlinux.org/mirrorlist/all/https/ -O mirrorlist.bak
            sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.bak
            rankmirrors -n 20 mirrorlist.bak | sudo tee mirrorlist
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
            reflector -l 20 -p https --sort rate --save /etc/pacman.d/mirrorlist
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
            echo "Optimizing Linux for Slow Computers"
            sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF
            vm.swappiness=1
            vm.vfs_cache_pressure=50
            vm.dirty_background_bytes=16777216
            vm.dirty_bytes=50331648
EOF
            sudo sysctl -w vm.swappiness=1
            sudo sysctl -w vm.vfs_cache_pressure=50
            sudo sysctl -w vm.dirty_background_bytes=16777216
            sudo sysctl -w vm.dirty_bytes=50331648
            clear ;;
        22)
            clear
            echo "Change User Password"
            passwd
            clear ;;
        23)
            clear
            echo "Edit /etc/resolv.conf file (Leafpad)"
            sudo leafpad  '/etc/resolv.conf'
            clear ;;
        24)
            clear
            echo "Install Pi-hole (curl)"
            sudo curl -sSL https://install.pi-hole.net | bash
            clear ;;
        25)
            clear
            echo "Exit :("
            exit 0
            clear ;;
    esac
done
