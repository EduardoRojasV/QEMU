#!/bin/bash
#
# Authors:
#  Jose Eduardo Rojas Vera <joseeduardo2511@outlook.es>
#
# This work is licensed under the terms of the GNU GPL, version 2.

#References

#https://wiki.qemu.org/Documentation
#https://wiki.qemu.org/Hosts/Linux

echo "**** Dependencies..." 

sudo apt update

echo "**** Required additional packages"

sudo apt-get install -y git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev

echo "**** Recommended additional packages"

sudo apt-get install -y git-email
sudo apt-get install -y libaio-dev libbluetooth-dev libbrlapi-dev libbz2-dev
sudo apt-get install -y libcap-dev libcap-ng-dev libcurl4-gnutls-dev libgtk-3-dev
sudo apt-get install -y libibverbs-dev libjpeg8-dev libncurses5-dev libnuma-dev
sudo apt-get install -y librbd-dev librdmacm-dev
sudo apt-get install -y libsasl2-dev libsdl1.2-dev libseccomp-dev libsnappy-dev libssh2-1-dev
sudo apt-get install -y libvde-dev libvdeplug-dev libvte-2.91-dev libxen-dev liblzo2-dev
sudo apt-get install -y valgrind xfslibs-dev

sudo apt-get install -y libwxgtk3.0-gtk3-dev

echo "**** Newer versions of Debian / Ubuntu might also try these additional packages:"

sudo apt-get install -y libnfs-dev libiscsi-dev

echo "**** Alsa"

echo "**** OpenGL"

echo "**** Others"

sudo apt-get install -y ninja-build clang python3 nmap
sudo apt-get install -y libvirt-daemon-system libvirt-clients bridge-utils virtinst

sudo apt-get install -y libguestfs-tools
#More information about libguestfs [ https://libguestfs.org/ ]
