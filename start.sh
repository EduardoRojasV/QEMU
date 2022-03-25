#!/bin/bash
# Authors:
#  Jose Eduardo Rojas Vera <joseeduardo2511@outllok.es>
#
# This work is licensed under the terms of the GNU GPL, version 2.

#Reference
#https://wiki.qemu.org/ChangeLog/6.2
#https://qemu.readthedocs.io/en/latest/system/arm/raspi.html

#Tutorials
#https://github.com/dhruvvyas90/qemu-rpi-kernel/tree/master/native-emulation
#https://www.extutorial.com/blog/313995

#Notas: El sistema init systemd proporciona órdenes adicionales para hacer las mismas funciones. 
#       Como por ejemplo: systemctl reboot o systemctl poweroff -nographic

QEMU=/home/$(whoami)/QEMU/qemu-6.2.0/bin/qemu-system-aarch64

HARDWARE=raspi3b
RAM=1G
KEYBOARD_DISTRIBUTION=es
DISK=raspios.img
CORES=4

echo "***   Arrancando RaspiOS Lite" $(pwd)

sudo $QEMU \
-M $HARDWARE -m $RAM -smp $CORES -k $KEYBOARD_DISTRIBUTION \
-kernel ./bootpart/kernel8.img \
-dtb ./bootpart/bcm2710-rpi-3-b-plus.dtb  \
-append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=PARTUUID=95bc1119-02 rootdelay=1" \
-drive file=./$DISK,format=raw,if=sd \
-usb -device usb-mouse -device usb-kbd \
-device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:22

#"rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1"
#"rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=PARTUUID=95bc1119-02 rootdelay=1"

# Opciones por probar
#-serial stdio \
#-usb -device usb-mouse -device usb-kbd \
#-net user,hostfwd=tcp::5022-:22
#-device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5055-:22
#-redir tcp:5022::22 - Este parámetro redirige el puerto TCP22 de la Raspberry Pi al puerto TCP5022 de nuestro equipo, 
#                      de modo que podamos acceder mediante ssh al emulador:
#Ejemplo:
#    ~$ ssh pi@127.0.0.1 -p 5022
#Antes es necesario iniciar el servidor ssh con la utilidad raspi-config, de esta forma el cambio será permanente.

#-no-reboot

#Titulos para redactar el archivo de github
#Construyendo QEMU