#!/bin/bash

# User Settings
declare -r INSTALL_DIR="/usr/local/"
declare -r DOWNLOAD_DIR="$HOME/Downloads/"
declare -r BASEURL="https://storage.googleapis.com/golang/"

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
DL_FILE=`echo $($WGET --quiet -O- $BASEURL | $EGREP -o 'go[0-9\.]+.linux-amd64.tar.gz' | sort -V  | tail -1)`
#DL_FILE="go1.9.linux-amd64.tar.gz"

# Create directories
## TODO - Add a check to skip

$MKDIR -p $DOWNLOAD_DIR


cd $DOWNLOAD_DIR
$WGET $BASEURL$DL_FILE
sudo $TAR -xf $DOWNLOAD_DIR$DL_FILE -C $INSTALL_DIR
$RM -f $DOWNLOAD_DIR$DL_FILE

$ECHO "Add the following to your .bashrc & .profile:"

$CAT << EOF

if [ -e "/usr/local/go/bin/go" ]
then
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:/usr/local/go/bin:$GOBIN

  if [ ! -d "$GOPATH" ]
     then
        mkdir -p $GOPATH/{src,pkg,bin}
  fi

fi

EOF

exit 0
