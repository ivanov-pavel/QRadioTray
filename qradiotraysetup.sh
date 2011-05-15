#!/bin/sh
sudo checkinstall -D --pkgname=qradiotray --pkgversion=1.19 --pkgarch=i386 --pkgrelease=1 --pkggroup=audio --requires='libqtcore4, libqtgui4, libqt4-dbus, libqt4-network, libqt4-xml, libphonon4, phonon, phonon-backend-gstreamer' 
