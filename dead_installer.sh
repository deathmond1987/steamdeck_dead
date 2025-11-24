#!/usr/bin/env bash
set -xeuo pipefail

. /etc/os-release

if [[ "$ID" != "steamos" ]]; then
    echo "installer only for SteamDeck! exiting"
    exit 1
fi

SSD_PATH="/home/deck/.steam/steam/steamapps/common/Dead Space (2023)"
FLASH_PATH="/run/media/mmcblk0p1/steamapps/common/Dead Space (2023)"

if [[ -f "$SSD_PATH/Dead Space.exe" ]]; then
    INSTALL_PATH="$SSD_PATH"
    echo "Game .exe found in $SSD_PATH"
elif [[ -f "$FLASH_PATH/Dead Space.exe" ]]; then
    INSTALL_PATH="$FLASH_PATH"
    echo "Game .exe found in $FLASH_PATH"
else
    echo "Game .exe file not found. Is game installed?"
    exit 1
fi

cp ./CryptBase.dll ~/.local/share/Steam/steamapps/compatdata/1693980/pfx/drive_c/windows/system32/
cp "$INSTALL_PATH/Data/Win32/globals.toc" ./ 
cp "$INSTALL_PATH/Data/layout.toc" ./
cp -r ./Data "$INSTALL_PATH"
mv ./layout.toc "$INSTALL_PATH"/Data/
#mv ./globals.toc "$INSTALL_PATH"/Data/Win32/

rm -f ./CryptBase.dll
rm -rf ./Data

echo "Install finished!"
