
#-------------------------------------------------
#
# Project created by QtCreator 2024-10-17T08:46:15
#
#-------------------------------------------------

# QT += core gui
# QT += core
QT += core gui qml quick
# QT += quick qml
QT += widgets
QT += quickcontrols2


#// worked well in doker
QT += sql
INCLUDEPATH += /usr/bin/sqlite3
LIBS += -lsqlite3
#//=====================




#===================================================
#INCLUDEPATH += /usr/include
#LIBS += -lcjson
#---
INCLUDEPATH += /usr/local/include
LIBS += -L/usr/local/lib -lcjson
#===================================================



# greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = uiredis
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
# DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0



SOURCES += \
        main.cpp \
        back.cpp \
    taximeterconfig.cpp \
    commonfile.cpp \
    taxiemeterlogs.cpp

# QML files
QML_FILES += main.qml
RESOURCES += UntitledProject3.qrc

CONFIG += quick_compiler
QML_IMPORT_PATH += $$PWD/imports
QML_COMPILER_OUTPUT_DIR = $$OUT_PWD/qml

#CONFIG += qml_plugin
QTPLUGIN += QuickStudioComponentsplugin \
            QuickStudioEffectsplugin \
            QuickStudioApplicationplugin \
            FlowViewplugin \
            QuickStudioLogicHelperplugin \
            QuickStudioMultiTextplugin \
            QuickStudioEventSimulatorplugin \
            QuickStudioEventSystemplugin \
            QtQuick.VirtualKeyboard

# DEFINES += BULD_QDS_COMPONENTS=true
# DESTDIR = $$OUT_PWD/qml

#  QML_IMPORT_PATH +=  /Qt/Tools/QtDesignStudio-4.1.1-lts/qt5_design_studio_reduced_version/qml/QtQuick/VirtualKeyboard
target.path = $$[QT_INSTALL_EXAMPLES]/opengl/uiredis
INSTALLS += target

HEADERS += \
    back.h \
    taximeterconfig.h \
    commonfile.h \
    taxiemeterlogs.h

# CONFIG -= app_bundle
# Include directories for hiredis
INCLUDEPATH += /usr/include/hiredis
# Link against the hiredis library
LIBS += -lhiredis

# Compiler warnings (optional but recommended)
QMAKE_CXXFLAGS += -Wall -Wextra
