#!/usr/bin/env bash
clear
echo -e "\033[36m""*********************************************************"
echo -e "************ Hosts Downloader by ZeroDot1 ***************"
echo -e "*********************************************************"
tput setaf 2
options=(
    "Download Hosts"
    "Merge all files"
    "Clean the hosts file"
    "EXIT :("
)

select option in "${options[@]}"; do
    case "$REPLY" in 
        1) 
        sudo rm -rf ChOstS
        mkdir -p ChOstS 
        cd $HOME/ChOstS 
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate http://winhelp2002.mvps.org/hosts.txt -O 1.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate http://someonewhocares.org/hosts/hosts -O 2.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/fademind-add.dead/list.txt -O 3.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/adaway.org/list.txt -O 4.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/ZeroDot1/CoinBlockerLists/master/hosts -O 5.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://hblock.molinero.xyz/hosts -O 6.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/fademind-add.2o7net/list.txt -O 7.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/fademind-add.risk/list.txt -O 8.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/fademind-add.spam/list.txt -O 9.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/kadhosts/list.txt -O 10.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/malwaredomainlist.com/list.txt -O 11.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/hosts -O 12.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/StevenBlack/hosts/master/data/SpotifyAds/hosts -O 13.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts -O 14.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/StevenBlack/hosts/master/data/UncheckyAds/hosts -O 15.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/StevenBlack/hosts/master/data/adaway.org/hosts -O 16.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/StevenBlack/hosts/master/data/malwaredomainlist.com/hosts -O 17.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/zant95/hMirror/master/data/fademind-add.dead/list.txt -O 18.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/StevenBlack/hosts/master/data/mvps.org/hosts -O 19.txt
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://raw.githubusercontent.com/StevenBlack/hosts/master/data/yoyo.org/hosts -O 20.txt ;;
        2) 
        sudo cat 1.txt 2.txt 3.txt 4.txt 5.txt 6.txt 7.txt 8.txt 9.txt 10.txt 11.txt 12.txt 13.txt 14.txt 15.txt 16.txt 17.txt 18.txt 19.txt 20.txt > ChOstS.txt 
        sleep 15 ;;
        3) 
        echo "Clean the hosts file"
        cd $HOME/ChOstS
        # Remove duplicate lines
        awk '!seen[$0]++' ChOstS.txt
        # Replace lines 
        cat ChOstS.txt | sed -e "s/127.0.0.1 /0.0.0.0 /" > ChOstSt.txt
        # Sort 
        sort -u ChOstSt.txt > ChOstS.txt
        # Remove all comments
        sed -i '/^\s*[@#]/ d' ChOstS.txt
        # Delete empty lines
        sed '/^\s*$/d' ChOstS.txt 
        clear ;;
        4) 
        exit 0 
        clear ;;
    esac
done
