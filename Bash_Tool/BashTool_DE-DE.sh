#!/usr/bin/env bash
clear
echo "Bitte führen sie folgenden Befehl aus um Bash Tool verwenden zu können: \n sudo pacman -Syy --force dialog"
cmd=(dialog --backtitle "Bash Tool, Bash Quick and easy! von ZeroDot1 (Deutsche Version)" --menu "Wählen sie eine Option:" 22 76 16)

options=(
    1 "Pacman Datenbank Aktualisiren (Pacman)"
    2 "Systemupdate mit Pacman (Pacman)"
    3 "Systemupdate mit Pacaur (Pacaur)"
    4 "Update-Hosts Ad and Malwareblock Aktualisiren"
    5 "Installiere Update-Hosts Ad and Malwareblock"
    6 "Pacmancache Leeren um Speicherplatz zu gewinnen"
    7 "Optimiren der Pacmandatenbangeschwindigkeit"
    8 "Systemctl nscd neustarten"
    9 "Systemctl dnsmasq neustarten"
    10 "Systemctl named neustarten"
    11 "Informationen über Bash Tool"
    12 "Bearbeite die Datei /etc/hosts mit (Leafpad)"
    13 "NVIDIA Automatische Konfiguration (nvidia-xconfig)"
    14 "ClamAV: Virusdefinitionen Aktualisiren"
    15 "ClamAV: Das System scannen und Viren entfernen"
    16 "Rankmirrors: Den schnellsten Downloadserver für Updates wählen (Wget HTTPS Only)"
    17 "Initialisiren des Schlüsselbundes und die Verifikation der Masterschlüssel"
    18 "Rankmirrors: Den schnellsten Downloadserver für Updates wählen (reflector)"
    19 "Computer Ausschalten"
    20 "Computer Neustarten"
    21 "Linux für langsame Computer optimieren"
    22 "User Password ändern"
    23 "Bearbeite die Datei /etc/resolv.conf mit (Leafpad)"
    24 "Pi-hole installieren (pacaur)"
    25 "Teamviewer Fernwartung starten"
    26 "Bash Tool schließen :("
    )

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            clear
            tput setaf 2
            echo "Pacman Datenbank Aktualisiren (Pacman)"
            sudo pacman -Syy --force
            echo "Fertig!" ;;
        2)
            clear
            tput setaf 2
            echo "Systemupdate mit Pacman (Pacman)"
            sudo pacman -Syyu --force
            echo "Bitte starten sie den Computer neu damit die Änderungen wirksam werden." ;;
        3)
            clear
            tput setaf 2
            echo "Systemupdate mit Pacman (Pacaur)"
            pacaur -Syyu --force
            echo "Bitte starten sie den Computer neu damit die Änderungen wirksam werden." ;;
        4)
            clear
            tput setaf 2
            echo "Update-Hosts Ad and Malwareblock Aktualisiren"
            update-hosts
            echo "Fertig!" ;;
        5)
            clear
            tput setaf 2
            echo "Installiere Update-Hosts Ad and Malwareblock"
            pacaur -Syy --force update-hosts-git
            echo "Fertig!" ;;
        6)
            clear
            tput setaf 2
            echo "Pacmancache Leeren um Speicherplatz zu gewinnen"
            sudo pacman -Scc
            echo "Fertig!" ;;
        7)
            clear
            tput setaf 2
            echo "Optimiren der Pacmandatenbangeschwindigkeit"
            sudo pacman-optimize && sync
            echo "Fertig!" ;;
        8)
            clear
            tput setaf 2
            echo "Systemctl nscd neustarten"
            systemctl restart nscd ;;
        9)
            clear
            tput setaf 2
            echo "Systemctl dnsmasq neustarten"
            sudo systemctl restart dnsmasq ;;
        10)
            clear
            tput setaf 2
            echo "Systemctl named neustarten"
            sudo systemctl restart named ;;
        11)
            clear
            echo "Informationen über Bash Tool"
            dialog --backtitle "Bash Tool, Bash Quick and easy! von ZeroDot1" --title 'Informationen über Bash Tool' --msgbox ' Bash Tool, Bash Quick and easy! \n Version 1.0.2.x \n (c) 2018 by ZeroDot1 \n
 Homepage: https://galaxy-bytes.blogspot.de/ \n Github: https://github.com/ZeroDot1 \n Sprache: Deutsch \n Überstezt von: ZeroDot1 \n Letztes Update: 10.02.2018 15:57' 15 60
            clear ;;
        12)
            clear
            echo "Bearbeite die Datei /etc/hosts mit (Leafpad)"
            sudo leafpad  '/etc/hosts'
            echo "Fertig!" ;;
        13)
            clear
            echo "NVIDIA Automatische Konfiguration (nvidia-xconfig)"
            sudo nvidia-xconfig
            echo "Bitte starten sie den Computer neu damit die Änderungen wirksam werden." ;;
        14)
            clear
            echo "ClamAV: Virusdefinitionen Aktualisiren"
            echo "Sollte das Update beim ersten mal nicht funktionieren starten sie es bitte erneut."
            sudo rm -rf '/var/lib/clamav/mirrors.dat'
            sudo freshclam -v -d
            sudo freshclam
            echo "Fertig! : Sie können ihren Computer nun auf Malware prüfen." ;;
        15)
            clear
            echo "ClamAV: Das System scannen und Viren entfernen"
            echo "ACHTUNG! Wenn Viren oder andere Malware gefunden wird wird sie unverzuglich gelöascht."
            sudo clamscan -r -v -a --remove /
            echo "Bitte starten sie den Computer neu damit die Änderungen wirksam werden." ;;
        16)
            clear
            echo "Rankmirrors: Den schnellsten Downloadserver für Updates wählen (Wget HTTPS Only)"
            echo "ACHTUNG! Dieser Vorgang nimmt einige Minuten in anspruch, bitte warten sie bis der Prozess abgeschossen ist."
            cd /etc/pacman.d/
            sudo rm -rf /etc/pacman.d/mirrorlist.bak
            sudo rm -rf '/etc/pacman.d/index.html'
            sudo wget --verbose --referer=https://archlinux.org/ -t 20 --no-check-certificate https://www.archlinux.org/mirrorlist/all/https/ -O mirrorlist.bak
            sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.bak
            rankmirrors -n 20 mirrorlist.bak | sudo tee mirrorlist
            sudo pacman -Syy --force
            echo "Fertig! : Sie haben nun den Schnellsten Downloadserver gewählt."
            echo "Sollten beim Update Probleme auftreten starten sie den Prozess erneut." ;;
        17)
            clear
            echo "Initialisiren des Schlüsselbundes und die Verifikation der Masterschlüssel"
            echo "ACHTUNG! Dieser Vorgang nimmt einige Minuten in anspruch, bitte warten sie bis der Prozess abgeschossen ist."
            sudo rm /var/lib/pacman/sync/*
            sudo pacman-key --init
            sudo pacman-key --populate archlinux antergos
            sudo pacman-key --refresh-keys
            sudo pacman -Syy --force
            cd $HOME
            echo "Fertig!" ;;
        18)
            clear
            echo "Rankmirrors: Den schnellsten Downloadserver für Updates wählen (reflector)"
            reflector -l 20 -p https --sort rate --save /etc/pacman.d/mirrorlist
            echo "Fertig!" ;;
        19)
            clear
            echo "Computer Ausschalten, Danke das sie Bash Tool verwendet haben."
            poweroff
            clear ;;
        20)
            clear
            echo "Computer Neustarten, Danke das sie Bash Tool verwendet haben."
            reboot
            clear ;;
        21)
            clear
            echo "inux für langsame Computer optimieren"
            echo "ACHTUNG! Diesen Vorgang müssen sie nur ein einziges mal ausführen."
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
            clear
            echo "Bitte starten sie den Computer neu damit die Änderungen wirksam werden." ;;
        22)
            clear
            echo "User Password ändern"
            echo "ACHTUNG! Wenn sie sich ihr Passwort nich merken können notieren sie es an einem sicheren Ort, und gebe sie es nicht weiter."
            passwd
            clear ;;
        23)
            clear
            echo "Bearbeite die Datei /etc/resolv.conf mit (Leafpad)"
            sudo leafpad  '/etc/resolv.conf'
            clear ;;
        24)
            clear
            echo "Pi-hole installieren (pacaur)"
            # https://wiki.archlinux.org/index.php/Pi-hole
            sudo pacaur -Syy --force pi-hole-standalone
            clear ;;
        25)
            clear
            echo "Teamviewer Fernwartung starten"
            echo "Mit Teamviewer ist es möglich ihnen aus der Ferne zu helfen wenn sie ein Problem haben."
            teamviewer --daemon steart
            /opt/teamviewer/tv_bin/script/teamviewer
            clear ;;
        26)
            clear
            echo "Bash Tool schließen :(, Danke das sie Bash Tool verwendet haben."
            exit 0
            clear ;;
    esac
done
