#!/bin/bash
#
# Authors:
#  Jose Eduardo Rojas Vera <joseeduardo2511@outlook.es>
#
# This work is licensed under the terms of the GNU GPL, version 2.

#References

#https://wiki.qemu.org/Documentation/Platforms/ARM
#https://wiki.qemu.org/ChangeLog/6.2
#https://www.qemu.org/download/

VERSION=qemu-6.2.0
PATH_TO=/home/$(whoami)/QEMU
SRC=src-$VERSION
BUILD=build-$VERSION
CPUS=2

function download () {

    echo "**** Download QEMU from https://download.qemu.org/"$VERSION".tar.xz"
    mkdir $SRC $BUILD $VERSION
    cd $SRC
    wget https://download.qemu.org/$VERSION.tar.xz
    tar xvJf $VERSION.tar.xz

}

function srcQEMU () {

    if [[ -d $PATH_TO ]];
    then
        cd $PATH_TO
        if [[ -d $SRC ]];
        then
            echo "**** Source code from QEMU " $VERSION " existe..."
            if [[ -d $VERSION ]];
            then
                rm -r $VERSION
            fi
            mkdir $BUILD $VERSION
        else
            download
        fi
    else
        mkdir -p $PATH_TO
        cd $PATH_TO
        download
    fi

}

function buildQEMU () {

    if [[ -f $PATH_TO/$SRC/$VERSION/configure ]];
    then
        cd $PATH_TO/$BUILD
        echo "*** Ruta: " $(pwd)
        ./../$SRC/$VERSION/configure --help > $PATH_TO/$VERSION/configure-help-build-$VERSION
        ./../$SRC/$VERSION/configure --target-list=arm-softmmu,aarch64-softmmu --prefix=$PATH_TO/$VERSION > $PATH_TO/$VERSION/configure-build-$VERSION                     
        echo "**** Compiling..."
        make -j$CPUS
        echo "**** Installing..."
        make install > $PATH_TO/$VERSION/installed-$VERSION
        rm -r $PATH_TO/$BUILD
        echo "**** QEMU was Installed..."
    else
        echo "File configure not exists..."
    fi
}

echo "**** Download and Compile QEMU" $VERSION "..."
srcQEMU
buildQEMU
