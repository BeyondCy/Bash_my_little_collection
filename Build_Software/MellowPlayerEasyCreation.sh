#!/usr/bin/env bash
#-----------------------------------------------------------------------------
#
# This file is part of MellowPlayer.
#
# MellowPlayer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# MellowPlayer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with MellowPlayer.  If not, see <http://www.gnu.org/licenses/>.
#
#-----------------------------------------------------------------------------
# author: ZeroDot1 https://github.com/ZeroDot1 , Colin Duquesnoy https://github.com/ColinDuquesnoy
# author website: https://goo.gl/ZuWQB2 , https://github.com/ColinDuquesnoy
# version: 1.1
# date time: 01.20.2018 16:03
#-----------------------------------------------------------------------------
clear
echo -e "\033[36m""*******************************************************************"
echo -e "************ MellowPlayer Easy Creation by ZeroDot1 ***************"
echo -e "*******************************************************************"
tput setaf 2
options=(
    "Install dependencies Arch Linux"
    "Install dependencies Ubuntu 17.10"
    "Build MellowPlayer"
    "EXIT :("
)

select option in "${options[@]}"; do
    case "$REPLY" in 
        1) 
        echo "Install dependencies Arch Linux"
        pacaur -Syy --force base-devel qt5-tools qt5-quickcontrols2 qt5-quickcontrols qt5-graphicaleffects qt5-webengine qt5-translations qt5-svg cmake git xorg-server-xvfb libnotify ;;
        2) 
        echo "Install dependencies Ubuntu 17.10"
        sudo apt-get install build-essential git cmake qtbase5-dev qtdeclarative5-dev qtwebengine5-dev qtquickcontrols2-5-dev qtpositioning5-dev qtbase5-private-dev qtdeclarative5-qtquick2-plugin qml-module-qtquick-* qml-module-qtwebengine libqt5svg5-dev qttools5-dev-tools qttranslations5-l10n libnotify-dev qml-module-qt-labs-platform qtdeclarative5-models-plugin qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel ;;
        3) 
        echo "Build MellowPlayer"
        clear
        tput setaf 2
        echo '##############################################################################'
        echo '# Script to beta test MellowPlayer with Linux                                #'
        echo '# ************************************************************************** #'
        echo '# https://github.com/ColinDuquesnoy/MellowPlayer/wiki/Beta-testing           #'
        echo '##############################################################################'
        sleep 2s
        read -rsp $'Delete old MellowPlayer BETA build [$HOME/MellowPlayer-develop]. Press any key or wait 5 seconds to continue...\n' -n 1 -t 5;
        rm -rf MellowPlayer-develop
        read -rsp $'MellowPlayer Testbuild for Arch Linux. This action can take a few moments to complete. Press any key or wait 5 seconds to continue...\n' -n 1 -t 5;
        echo 'Create Working Folder [./MellowPlayer-develop]'
        mkdir MellowPlayer-develop && pushd MellowPlayer-develop
        echo 'Download [ColinDuquesnoy/MellowPlayer/archive/develop.zip] . . . . .' 
        tput sgr0
        wget --verbose --referer=https://github.com/ -t 20 --no-check-certificate https://github.com/ColinDuquesnoy/MellowPlayer/archive/develop.zip
        tput setaf 2
        echo 'Unzip [develop.zip to $HOME/MellowPlayer-develop/MellowPlayer-develop] and Make [This action can take a few moments to complete]'
        unzip develop.zip
        pushd MellowPlayer-develop
        echo 'Compile in release mode . . . .'
        sleep 1s
        tput sgr0
        cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
        make
        tput setaf 2
        popd
        popd
        echo 'Run MellowPlayer . . . have fun!'
        echo 'If you find a bug while testing MellowPlayer, please report it.'
        echo 'https://github.com/ColinDuquesnoy/MellowPlayer/issues'
        sleep 2s
        MellowPlayer-develop/MellowPlayer-develop/src/main/MellowPlayer --log-level 1 ;;
        4) 
        exit 0 
        clear ;;
    esac
done
