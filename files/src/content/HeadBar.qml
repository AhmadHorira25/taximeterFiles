import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import QtQuick.Window 2.0

//Item {
//    width: Constants.width
//    height: Constants.height
Item {
    id: headBarframe
    x: 0
    y: 0
    width: 2560
    height: 121
    visible: true

    //    border.color: "#ffffff"
    //    color: Qt.rgba(0, 0, 0, 0.7)

    //    property alias label1Fontfamily: label1.font.family
    //    property alias label2Fontfamily: label2.font.family
//    Image {
//        id: path4605
//        x: 1214
//        y: 30
//        visible: true
//        source: "images/Path 460 5.png"
//        layer.enabled: false
//        clip: false
//        fillMode: Image.PreserveAspectFit
//    }


    Rectangle
    {
            y: 16
            width: 449
            height: 120
            color: "#00ffffff"
            radius: 0
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "#0fe6ef"
            border.width: 0
    //        Image {
    //            x: 23
    //            y: 18
    //            source: "images/Group 205.png"
    //            fillMode: Image.PreserveAspectFit
            //        }
//            Text {
//                color: "#ffffff"
//                anchors.centerIn: parent
//                text: qsTr("IOTISTIC")
//                font.letterSpacing: 7
//                verticalAlignment: Text.AlignVCenter
//                lineHeight: 1.1
//                font.family: "Encode Sans"
//                font.underline: true
//                font.pointSize: 60

//            }
                    Image {
                        source: "images/Logo.png"
                        scale: 0.75
                        fillMode: Image.PreserveAspectFit
                    }



        }


























    Image {
        id: group
        x: 1904
        y: 55
        visible: true
        source: "images/Group.png"
        layer.enabled: false
        clip: false
        fillMode: Image.PreserveAspectFit
    }

    Row {
        x: 1566
        y: 32
        spacing: 0
        Image {
            source: "images/Vector.png"
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            id: label
            width: 80
            height: 57
            color: "#ffffff"
            Connections {
                target: appUi
                onSystem_Kconstant: {
                    label.text = Kconst
                }
            }

            font.family: "Encode Sans"
            font.pointSize: 22
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            color: "#ffffff"
            text: qsTr("p/km")
            verticalAlignment: Text.AlignVCenter
            font.family: "Encode Sans"
            font.pointSize: 22
        }
    }

    Label {
        id: appDatelabel
        x: 1949
        y: 49
        width: 280
        height: 38
        visible: true
        //        text: qsTr("Sunday, May 13")
        font.letterSpacing: 0.1
        layer.enabled: false
        clip: false
        font.styleName: "Medium"
        font.weight: Font.Thin
        font.pointSize: 22
        font.family: "Encode Sans" //"encode sans"

        //        Connections {
        //            target: appUi
        //            onSystem_applicationTIME: {
        //                appTimeLabel.text = Qt.formatTime(applicationTIMEValue,
        //                                                  "hh:mm AP")
        //                appDatelabel.text = Qt.formatDate(applicationTIMEValue,
        //                                                  "dddd, MMMM d")
        //            }
        //        }
        text: Qt.formatDate(timeValue, "dddd, MMMM d")

        //        Connections {
        //            target: timeValue

        //            onchanged: {
        //                appTimeLabel.text = Qt.formatTime(applicationTIMEValue,
        //                                                  "hh:mm AP")
        //                appDatelabel.text = Qt.formatDate(applicationTIMEValue,
        //                                                  "dddd, MMMM d")
        //            }
        //        }
    }

    Label {
        id: appTimeLabel
        x: 2306
        y: 48
        width: 165
        height: 57
        visible: true
        //        text: qsTr("12:35 AM")
        text: Qt.formatTime(timeValue, "hh:mm AP")
        layer.enabled: false
        clip: false
        font.weight: Font.Light
        font.pointSize: 22
        font.family: "Encode Sans"
        //        Connections {
        //            target: appUi
        //            onsystem_applicationTIME:appTimeLabel.text = applicationTIMEValue
        //        }
    }
} //}
