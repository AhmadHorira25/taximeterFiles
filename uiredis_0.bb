SUMMARY = "Simple uiredis application"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


require recipes-qt/qt5/qt5.inc
DEPENDS += "qtbase"



# DEPENDS += "qtserialport"
# DEPENDS += "libusb"
# DEPENDS += "qtdeclarative"
DEPENDS += "hiredis"
DEPENDS += "qtbase qtdeclarative qtquickcontrols2 qtquickcontrols "
DEPENDS += "cjson"

FILESPATH =+ "${WORKSPACE}:"
SRC_URI = "file://src"


S = "${WORKDIR}/src"

inherit qmake5

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/uiredis ${D}${bindir}
}

FILES_${PN} += "${bindir}/uiredis"
