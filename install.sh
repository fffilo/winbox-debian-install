#!/bin/bash

# need root privileges to install
if [ $EUID -ne 0 ]; then
    echo "Error: This script must be run as root."
    exit 1
fi

# variables
OPT="/opt/winbox"
BIN="/usr/local/bin"
LNK="${HOME}/.local/share/applications"
EXE="https://mt.lv/winbox"
#SRC="https://raw.githubusercontent.com/fffilo/winbox-debian-install/master"
SRC="http://localhost:8000"

# download
mkdir -p "${OPT}"
wget "${EXE}" -O "${OPT}/winbox.exe"
wget "${SRC}/winbox.sh" -O "${OPT}/winbox.sh"
wget "${SRC}/winbox.svg" -O "${OPT}/winbox.svg"
wget "${SRC}/winbox.desktop" -O "${OPT}/winbox.desktop"

# create executable and shortcut
chmod +x "${OPT}/winbox.sh"
ln -sf "${OPT}/winbox.sh" "${BIN}/winbox"
ln -sf "${OPT}/winbox.desktop" "${LNK}/winbox.desktop"
