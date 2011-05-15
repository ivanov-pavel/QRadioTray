TEMPLATE = app
TARGET = qradiotray
DEPENDPATH += . debug release src ui translations
INCLUDEPATH += . src
UI_DIR = tmp
MOC_DIR = tmp
RCC_DIR = tmp

#
# Modules.
#

QT += core network phonon
QXT += core gui

#
# Build config.
#

CONFIG += qxt
CONFIG(debug, debug|release) {
    DEFINES += DEBUG
    linux-g++: OBJECTS_DIR = debug
    DESTDIR = debug
    CONFIG += console
    QMAKE_CXXFLAGS_DEBUG += -pg
    QMAKE_LFLAGS_DEBUG += -pg
}
else {
    DEFINES += QT_NO_DEBUG_OUTPUT
    linux-g++: OBJECTS_DIR = release
    DESTDIR = release
}

#
# Install config.
#

linux-g++ {
    INSTALLPATH = /usr/local/qradiotray
    target.path = $$INSTALLPATH
    target.files = release/qradiotray
    config.path = /$(HOME)
    config.files = config.ini
    icons.path = $$INSTALLPATH
    icons.files = qradiotray.png
    desktop.path = /usr/share/applications
    desktop.files = qradiotray.desktop
}

win32 {
    INSTALLPATH = C:\qradiotray
    target.path = $$INSTALLPATH
    target.files = release\qradiotray.exe
    config.path = $$INSTALLPATH
    config.files = config.ini
    icons.path = $$INSTALLPATH
    icons.files = qradiotray.png
    dlls.path = $$INSTALLPATH
    dlls.files = QtCore4.dll QtGui4.dll QtNetwork4.dll phonon4.dll mingwm10.dll libgcc_s_dw2-1.dll
    backends.path = $$INSTALLPATH\phonon_backend
    backends.files = phonon_ds94.dll
}

INSTALLS = target config icons
linux-g++:INSTALLS += desktop
win32:INSTALLS += dlls backends

#
# Files.
#

TRANSLATIONS += \
    qradiotray_en.ts \
    qradiotray_ru.ts

SOURCES += \
    main.cpp \
    application.cpp \
    player.cpp \
    settingsdialog.cpp \
    stationdialog.cpp \
    aboutdialog.cpp \
    logger.cpp

HEADERS += \
    application.h \
    player.h \
    station.h \
    settingsdialog.h \
    stationdialog.h \
    aboutdialog.h \
    logger.h

FORMS += \
    settingsdialog.ui \
    stationdialog.ui \
    aboutdialog.ui

RESOURCES += resources.qrc
win32:RC_FILE = qradiotray.rc

OTHER_FILES += \
    README \
    Changelog.txt \
    config.ini \
    CODING STYLE_ru.txt \
    CODING STYLE_en.txt
