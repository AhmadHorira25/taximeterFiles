import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Item {
    id:settingoagewindowe
    width: Constants.width
    height: Constants.height


    Rectangle{
        x:0
        y:0

        width: Constants.width
        height: Constants.height

        gradient: Gradient {

            orientation: Gradient.Horizontal
            GradientStop {
                //                id:/*hireButtonGrad1a*/
                position: 0
                color: "#000426"
            }
            GradientStop {
                //                id:/*hireButtonGrad1a*/
                position: 0.5
                color: "#000014"
            }
            GradientStop {
                //                id:hireButtonGrad1b
                position: 1
                color: "#000426"
            }
        }

        Image {
            id: group256
            x: 82
            y: 45
            source: "images/Group 256.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text2
            x: 140
            y: 48
            width: 249
            height: 42
            color: "#ffffff"
            text: qsTr("ADMIN SETTINGS")
            font.letterSpacing: 1.4
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Encode Sans"
        }



//        Frame {
//            id: frame
//            x: 72
//            y: 176
//            width: 2426
//            height: 368
//            spacing: 500




    }

    Rectangle{
        x:0
        y:582
        height: 138
        width: 2560

//        color: "#030317BF"
        gradient: Gradient {
            orientation:Gradient.Horizontal
            GradientStop {
//                id:/*hireButtonGrad1a*/
                position: 0
                color: "#030317BF"
            }
            GradientStop {
//                id:hireButtonGrad1b
                position: 1
                color: "#000014"
            }
        }

        Rectangle {
            id: rectangle
            x: 69
            y: 28
            width: 586
            height: 82
            color: "#00ffffff"
            radius: 12
            border.color: "#ffffff"
            border.width: 2

            Text {
                id: text1
                x: 265
                y: 21
                color: "#ffffff"
                text: qsTr("EXIT")
                font.pixelSize: 32
                font.family: "Montserrat"
            }
            MouseArea{
                id: settingExitbuttonArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
//                    hireConsole.visible=true
//                    tabscoslewndw.visible=true
//                    settingoagewindowe.visible=false

                    //                    mainWindowLoader.source = "Mainconsol.qml"
//                    pageLoader.source = "ConfigurationPage.qml"
                    pageLoader.source = "Mainconsol.qml"  // "Settingpage.qml"

                }
            }
        }


    }

    Row {
        spacing: 90  // Space between each Rectangle
        anchors.horizontalCenter: parent.horizontalCenter // Center the Row horizontally in the parent

    Rectangle {
        x: 72
        id: settingofConfigurationIcon //settingofTarifIcon
        y: 176
        width: 582
        height: 368
        color: "#00ffffff"
        radius: 24
        border.color: "#117bb1"
        border.width: 2

//            fillMode: Image.PreserveAspectFit

            Text {
//                id: text3
                x: 155
                y: 37
                width: 273
                height: 295
                color: "#ffffff"
                text: qsTr("CONFIGURATION")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                Image {
                    id: group169
                    x: 59
                    y: 0
                    source: "images/Group 169.png"
                }
            }

            MouseArea{
    //            id: settingExitbuttonArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    pageLoader.source = "ConfigurationPage.qml"
                }
            }

    }
    Rectangle {
        id: settingofTarifIcon
        x: 672
        y: 176
        width: 582
        height: 368
        color: "#00ffffff"
        radius: 24
        border.color: "#117bb1"
        border.width: 2

        Text {
            x: 218
            y: 49
            width: 146.34
            height: 270.58
            color: "#ffffff"
            text: qsTr("TARRIF")
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
            Image {
    //            id: group168
                source: "images/Group 168.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        MouseArea{
//            id: settingExitbuttonArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                pageLoader.source = "TariffconfigurationPage.qml"
            }
        }

    }

//    Rectangle {
//         id:totalizerIcon
//        x: -6
//        y: 176
//        width: 582
//        height: 368
//        color: "#00ffffff"
//        radius: 24
//        border.color: "#117bb1"
//        border.width: 2


//        Text {
//            x: 190
//            y: 51
//            width: 202
//            height: 267
//            color: "#ffffff"
//            text: qsTr("TOTALIZERS")
//            font.pixelSize: 40
//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignBottom
//            Image {
//                x: 41
//                y: 0
//                //            id: group168
//                source: "images/Group 167.png"
//                fillMode: Image.PreserveAspectFit
//            }
//        }
//        MouseArea{
////            id: settingExitbuttonArea
//            anchors.fill: parent
//            cursorShape: Qt.PointingHandCursor
//            onClicked: {
//                pageLoader.source = "AdminPageTotalizer.qml"
//            }
//        }

//    }



    Rectangle {
         id:audittrailIcon
        y: 176
        width: 582
        height: 368
        color: "#00ffffff"
        radius: 24
        border.color: "#117bb1"
        border.width: 2

        Text {
            x: 190
            y: 51
            width: 202
            height: 267
            color: "#ffffff"
            text: qsTr("AUDIT TRAIL")
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
            Image {
                x: 28
                y: 8
                //            id: group168
                source: "images/Group 170.png"
                fillMode: Image.PreserveAspectFit
            }
        }
        MouseArea{
//            id: settingExitbuttonArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                pageLoader.source = "AUDITTrailPage.qml"
            }
        }
    }

}



}
