#!/bin/bash

## User Settings
declare -r INSTALL_DIR="/opt/franz/"
declare -r DOWNLOAD_DIR="$HOME/Downloads/"

xdg-open https://github.com/meetfranz/franz-app/releases

read -p "What version are you downloading? (i.e. - 4.0.4): " VER

declare -r BASEURL="https://github.com/meetfranz/franz-app/releases/download/$VER/"



# Portability - executables
## TODO - use `which` to populate dynamically
declare -r WGET="/usr/bin/wget"
declare -r EGREP="/bin/egrep"
declare -r TAR="/bin/tar"
declare -r MKDIR="/bin/mkdir"
declare -r RM="/bin/rm"
declare -r ECHO="/bin/echo"
declare -r CAT="/bin/cat"
# Get the file name (Latest version)
DL_FILE="Franz-linux-x64-$VER.tgz"



# Create directories
## TODO - Add a check to skip

$MKDIR -p $DOWNLOAD_DIR


cd $DOWNLOAD_DIR
sudo mkdir -p $INSTALL_DIR

$WGET $BASEURL$DL_FILE
$WGET "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O franz-icon.png
sudo cp franz-icon.png $INSTALL_DIR
sudo $TAR -xf $DOWNLOAD_DIR$DL_FILE -C $INSTALL_DIR
$RM -f $DOWNLOAD_DIR$DL_FILE

sudo bash -c "$CAT << EOF > /usr/share/applications/franz.desktop

[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz
Icon=/opt/franz/franz-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet

EOF"

exit 0
