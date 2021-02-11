#!/bin/sudo /bin/bash
mkdir -p $1
getbusybox()
{
echo "fetching busybox from busybox.net"
wget https://busybox.net/downloads/binaries/1.26.2-i686/busybox -q --show-progress -O bb
}
getbusybox
mkdir -p $1/{bin,etc,sbin,usr}
mkdir -p $1/usr/sbin
mkdir -p $1/usr/
cp -f bb $1/bin/busybox
rm bb -f
cd $1/bin
ln -sf busybox sh
cd -
chroot $1 busybox --install -s
echo "done"
