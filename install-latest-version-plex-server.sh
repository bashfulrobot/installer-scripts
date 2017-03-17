#!/bin/bash


# User Settings
declare -r DOWNLOAD_DIR="$HOME/Downloads/"

# Portability - executables
## TODO - use `which` to populate dynamically
declare -r JQ="/usr/bin/jq"
declare -r CURL="/usr/bin/curl"
declare -r MKDIR="/bin/mkdir"
declare -r RM="/bin/rm"
declare -r ECHO="bin/echo"
declare -r DPKG="/usr/bin/dpkg"
declare -r TR="/usr/bin/tr"
declare -r SUDO="/usr/bin/sudo"
declare -r BASENAME="/usr/bin/basename"
declare -r DPKG_QUERY="/usr/bin/dpkg-query"
declare -r GREP="/bin/grep"
declare -r APT_GET="/usr/bin/apt-get"
# Functions
# Check if a package is installed or not
function check-if-installed {
if [ $($DPKG_QUERY -W -f='${Status}' $1 2>/dev/null | $GREP -c "ok installed") -eq 0 ];
then
  $SUDO $APT_GET install $1 -y;
fi
}

## Check if installed
check-if-installed jq -y

# Get the file name (Latest version)
## To explain the below command.
### Hit the plex public API to get JSON. To see raw unfiltered JSON output, use:
### curl -s 'https://plex.tv/api/downloads/1.json' | jq
### Then you can figure out the hierarchy.
### .computer.Linux.releases[] = is the path traversing down the hierarchy.
### The releases node contains many nodes at the same level (array or the like).
### Hence the "[]". We then select and match on Ubuntu as the "distro", and
### then look for Ubuntu. We then filter further based on a label that contains
### the architecture (64-bit). Then once we have filtered down to a single JSON
### object in which we read the URL to the deb file. Then "tr" simply strips
### the quotes at the beginning and end. The result is the URL to the deb file.
### *whew*.
declare -r DL_PATH=`$ECHO $($CURL -s 'https://plex.tv/api/downloads/1.json' | $JQ  '.computer.Linux.releases[] | select(.distro == "ubuntu") | select(.label | contains("64-bit"))' | $JQ '.url') | $TR -d '"'`

declare -R DL_FILE=`$ECHO $($BASENAME $DL_PATH)`

# Create directories
## TODO - Add a check to skip
$MKDIR -p $DOWNLOAD_DIR

cd $DOWNLOAD_DIR
$CURL -O $DL_PATH

$SUDO $DPKG -i $DL_FILE
$RM -f $DOWNLOAD_DIR$DL_FILE

exit 0