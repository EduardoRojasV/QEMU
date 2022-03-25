#!/bin/bash
# Authors:
#  Jose Eduardo Rojas Vera <joseeduardo2511@outllok.es>
#
# This work is licensed under the terms of the GNU GPL, version 2.

#Reference
#https://wiki.qemu.org/ChangeLog/6.2
#https://qemu.readthedocs.io/en/latest/system/arm/raspi.html

QEMU=/home/$(whoami)/QEMU/qemu-6.2.0/bin/qemu-system-aarch64

HARDWARE=raspi3b
RAM=1G
KEYBOARD_DISTRIBUTION=es
DISK=raspios.img
CORES=4

echo "***   Start RaspiOS Lite" $(pwd)

sudo $QEMU \
-M $HARDWARE -m $RAM -smp $CORES -k $KEYBOARD_DISTRIBUTION \
-kernel ./bootpart/kernel8.img \
-dtb ./bootpart/bcm2710-rpi-3-b-plus.dtb  \
-append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=PARTUUID=95bc1119-02 rootdelay=1" \
-drive file=./$DISK,format=raw,if=sd \
-usb -device usb-mouse -device usb-kbd \
-device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:22
