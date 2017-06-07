#!/bin/bash


##### IN PROGRESS - not working


# User Settings
declare -r INSTALL_DIR="/usr/local/"
declare -r DOWNLOAD_DIR="$HOME/Downloads/"
declare -r BASEURL="https://turtlapp.com/releases/desktop/"

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
DL_FILE=`echo $($WGET --quiet -O- $BASEURL | $EGREP -o 'turtl-linux64-[0-9\.]+.tar.bz2' | sort -V  | tail -1)`

# Create directories
## TODO - Add a check to skip

$MKDIR -p $DOWNLOAD_DIR


cd $DOWNLOAD_DIR
$WGET $BASEURL$DL_FILE
$TAR -xf $DOWNLOAD_DIR$DL_FILE -C $INSTALL_DIR
$RM -f $DOWNLOAD_DIR$DL_FILE

exit 0
