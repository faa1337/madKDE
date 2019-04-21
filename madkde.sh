#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "You need to be a root"
    exit 1
fi

cp /usr/lib/x86_64-linux-gnu/libkdeinit5_dolphin.so /usr/lib/x86_64-linux-gnu/libkdeinit5_dolphin.so.bak
cp -f libkdeinit5_dolphin.so /usr/lib/x86_64-linux-gnu/libkdeinit5_dolphin.so
cp /usr/bin/kate /usr/bin/kate.bak
cp -f kate /usr/bin/kate
cp /etc/pam.d/sddm /etc/pam.d/sddm.bak
sed /root/s/^/#/ /etc/pam.d/sddm > /etc/pam.d/sddm
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
echo "Done"
echo "Enjoy your full freedom"
