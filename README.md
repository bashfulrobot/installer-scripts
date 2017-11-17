# NOTE - I'm depreciating this repo in favour of snap packages (https://snapcraft.io / https:forum.snapcraft.io). These were just meant to ease re-installation of my systems. There are many better ways to do this.

# installer-scripts

A collection of bash scripts that will download and install packages that I use that traditionally require you going to a website to download the DEB, TAR, etc.

* Any scripts that use `dpkg`, or `apt` would be Ubuntu specific.
* Others should work on most *nix* systems.
* I test on [Ubuntu Budgie](http://www.ubuntubudgie.org), however your desktop wouldn't matter. So any Ubuntu should work fine.

## Scripts TOC

### Golang
### Script `install-latest-version-golang.sh`
#### Description
* Downloads the latest golang version and installs.

### Plex Server
### Script `install-latest-version-plex-server.sh`
#### Description
* Downloads and installs the latest version of the Plex Server DEB file. Leverages the Plex public API to get the latest version. Currenty targets Ubuntu 64-bit. Would be easy to change.

### Neovim/Spacevim
### Script `install-spacevim.sh`
#### Description
* Downloads and installs Neovim, and then Spacevim (and associated packages) on Ubuntu. There is one command with curls a script into bash. I evaluated the script before installing, and I highly suggest that you do too.
