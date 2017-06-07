#!/bin/bash

# User Settings
declare -r INSTALL_DIR="/opt"
declare -r DOWNLOAD_DIR="$HOME/Downloads"
declare -r DOWN_URL="https://telegram.org/dl/desktop/linux"
declare -r DOWN_ICON_URL="https://www.iconfinder.com/icons/1419139/download/png/256"

# Portability - executables
## TODO - use `which` to populate dynamically
declare -r WGET="/usr/bin/wget"
declare -r EGREP="/bin/egrep"
declare -r TAR="/bin/tar"
declare -r MKDIR="/bin/mkdir"
declare -r RM="/bin/rm"
declare -r ECHO="/bin/echo"
declare -r CAT="/bin/cat"
declare -r LS="/bin/ls"

## Make the install sane

$RM -f $DOWNLOAD_DIR/tsetup*

## Get the file name
## Bad design - replies on the format of the file name that is downlaoded.

FILENAME=$($LS $DOWNLOAD_DIR | $EGREP tsetup)

# Create directories
## TODO - Add a check to skip

$MKDIR -p $DOWNLOAD_DIR


cd $DOWNLOAD_DIR

$WGET $DOWN_URL -O telegramSetup.tar.xz
$WGET $DOWN_ICON_URL -O telegram-icon.png
sudo $TAR -xf $DOWNLOAD_DIR/telegramSetup.tar.xz -C $INSTALL_DIR
sudo mv $INSTALL_DIR/Telegram $INSTALL_DIR/telegram
sudo cp telegram-icon.png $INSTALL_DIR/telegram

$RM -f $DOWNLOAD_DIR/telegramSetup.tar.xz

sudo bash -c "$CAT << EOF > /usr/share/applications/telegram.desktop

[Desktop Entry]
Name=Telegram
Comment=
Exec=/opt/telegram/Telegram
Icon=/opt/telegram/telegram-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet

EOF"

exit 0
