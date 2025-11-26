import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Item {
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
                position: 0
                color: "#000426"
            }
            GradientStop {
                position: 0.5
                color: "#000014"
            }
            GradientStop {
                position: 1
                color: "#000426"
            }
        }
    }

    Row{
        x:72
        y:35
        height: 74
        spacing: 10
        Image {
            source: "images/Group 255 1.png"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            color: "#ffffff"
            text: qsTr("ABOUT")
            font.family: "Roboto"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Row{
        width: parent.width/1.267
        height: 420
        x:309
        y:157
        spacing: 32


    Item {
        id:settingscrollwindow
        width: 1943
        height: 420
//        x:309
//        y:157
        ScrollView {

            id: adminTotalizerscrollView
            width: parent.width //- 20
            height: 420
            anchors.centerIn: parent
            clip: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
            Flickable {
                id: flickableContent
                contentWidth: parent.width
                contentHeight: infolist.height

               Column{
                   spacing: 32
                   id: infolist
                Text {
                    text: "DEVICE INFO"
                    font.letterSpacing: -1.8
                    font.pixelSize: 40
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Roboto"
                    color: "#ffffff"
                }


                Rectangle{

                    height: infoclm1.height+infoclm1.spacing*2
                    color: "#00ffffff"
                    radius: 12
                    border.color: "#117bb1"
                    border.width: 2
                    width: 1936

Row{
    width: parent.width
    anchors.verticalCenter: parent.verticalCenter
    spacing: 246

                Column{
                    id:infoclm1
                    spacing: 56
                    width: parent.width/2.9


                Rectangle {
                    width: parent.width //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
                    height: 73
                    color: "transparent"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 0
                    Row{
                        x: 58
//                        y: 44
//                        anchors.fill: parent
                        spacing: 52
                        Text {
                            width: 390
                            text: "Manufacture Name"
                            font.letterSpacing: 1
                            font.pixelSize: 40
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#0FE6EF"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            text: "IOTISTIC"
                            font.letterSpacing: -0.1
                            font.pixelSize: 62
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto Condensed"
                            color: "#ffffff"
//                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                Rectangle {
                    width: parent.width //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
                    height: 73
                    color: "transparent"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 0
                    Row{
                        x: 58
                        spacing: 52
                        Text {
                            width: 390
                            text: "Serial Number"
                            font.letterSpacing: 1
                            font.pixelSize: 40
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#0FE6EF"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            text: "123456789"
                            font.letterSpacing: -0.1
                            font.pixelSize: 62
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto Condensed"
                            color: "#ffffff"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

//                Rectangle {
//                    width: parent.width //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
//                    height: 73
//                    color: "transparent"
//                    radius: 12
//                    border.color: "#117BB1"
//                    border.width: 0
//                    Row{
//                        x: 58
//                        visible: false
//                        spacing: 52
//                        Text {
//                            width: 390
//                            text: "Year of Manufacturer"
//                            font.letterSpacing: 1
//                            font.pixelSize: 40
//                            verticalAlignment: Text.AlignVCenter
//                            font.family: "Roboto"
//                            color: "#0FE6EF"
//                            anchors.verticalCenter: parent.verticalCenter
//                        }
//                        Text {
//                            text: "2023"
//                            font.letterSpacing: -0.1
//                            font.pixelSize: 62
//                            horizontalAlignment: Text.AlignLeft
//                            verticalAlignment: Text.AlignVCenter
//                            font.family: "Roboto Condensed"
//                            color: "#ffffff"
//                            anchors.verticalCenter: parent.verticalCenter
//                        }
//                    }
//                }
                }


                Column{
                    id:infoclm2
                    spacing: 56
                    width: parent.width/2.14


                Rectangle {
                    width: parent.width //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
                    height: 73
                    color: "transparent"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 0
//                    Row{
//                        x: 58
//                        y: 44
//                        spacing: 52
//                        anchors.fill: parent
                        Text {
                            text: "K Constant Range"
                            font.letterSpacing: 1
                            font.pixelSize: 40
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#0FE6EF"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            text: "1-6000 pulse/km"
                            font.letterSpacing: -0.1
                            font.pixelSize: 62
                            horizontalAlignment: Text.AlignRight
                            font.family: "Roboto Condensed"
                            color: "#ffffff"
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
//                    }

                }

//                Rectangle {
//                    width: parent.width //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
//                    height: 73
//                    visible: false
//                    color: "transparent"
//                    radius: 12
//                    border.color: "#117BB1"
//                    border.width: 0
////                    Row{
////                        x: 58
////                        y: 44
////                        spacing: 52
////                        anchors.fill: parent
//                        Text {
//                            text: "Certificates"
//                            font.letterSpacing: 1
//                            font.pixelSize: 40
//                            verticalAlignment: Text.AlignVCenter
//                            font.family: "Roboto"
//                            color: "#0FE6EF"
//                            anchors.verticalCenter: parent.verticalCenter
//                        }
//                        Text {
//                            text: "ROHS/CE/FCC/OIML"
//                            font.letterSpacing: -0.1
//                            font.pixelSize: 62
//                            horizontalAlignment: Text.AlignRight
//                            font.family: "Roboto Condensed"
//                            color: "#ffffff"
//                            anchors.right: parent.right
//                            anchors.verticalCenter: parent.verticalCenter
//                        }
////                    }
//                }

                Rectangle {
                    width: parent.width //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
                    height: 73
                    color: "transparent"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 0
                }
                }














}
}

//                Row{

                    Row{
                        x: 52
//                        spacing: 254
                        Text {
                            width: 308
                            color: "#ffffff"
                            text: qsTr("Software Version")
                            font.pixelSize: 40
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"

                        }
                        Text{
                            width: 254
                        }

//                        Text {
//                            width: 308
//                            visible: false
//                            color: "#ffffff"
//                            text: qsTr("Release Date")
//                            font.pixelSize: 40
//                            verticalAlignment: Text.AlignVCenter
//                            font.family: "Roboto"

//                        }
//                        Text{
//                            width: 380
//                        }
//                        Text {
//                            width: 308
//                            visible: false
//                            color: "#ffffff"
//                            text: qsTr("Md5 Hash")
//                            font.pixelSize: 40
//                            verticalAlignment: Text.AlignVCenter
//                            font.family: "Roboto"

//                        }
                    }
                    Rectangle{
                        color: "#00ffffff"
                        radius: 12
                        border.color: "#117bb1"
                        border.width: 2
                        width: 1936
                        height: 117

                        Row{
                            x: 92.6// 52+52
                            width: 1812
                            spacing: 185.2// 52

                           anchors.verticalCenter: parent.verticalCenter
                           anchors.horizontalCenter: parent.horizontalCenter
                            Text {
                                width: 308
                                color: "#ffffff"
                                text: qsTr("V1.0")
                                font.pixelSize: 40
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Roboto"

                            }
//                            Text {
//                                width: 308
//                                visible: false
//                                color: "#ffffff"
//                                text: qsTr("1/1/2024")
//                                font.pixelSize: 40
//                                horizontalAlignment: Text.AlignHCenter
//                                verticalAlignment: Text.AlignVCenter
//                                font.family: "Roboto"

//                            }
//                            Text {
//                                width: 733
//                                visible: false
//                                color: "#ffffff"
//                                text: qsTr("2f:e8:d7:cf:83:98 application/mpeg4-iod")
//                                font.pixelSize: 40
//                                horizontalAlignment: Text.AlignHCenter
//                                verticalAlignment: Text.AlignVCenter
//                                font.family: "Roboto"

//                            }
                        }
                    }

//                }

                }
            }
        }
    }


    Rectangle {
        id: adminTotalizercustomSlider
        x: 2243
        y: 10
        width: 20
        height: adminTotalizerscrollView.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 7
        color: "transparent"
        Rectangle {
            width: 16
            height: parent.height
            anchors.centerIn: parent
            color: "#082F43"
            radius: 90
            border.width: 0
        }

        // Rectangular adminTotalizerhandle (draggable knob)
        Rectangle {
            id: adminTotalizerhandle
            width: 32
            height: 230   // Make the adminTotalizerhandle taller for better interaction
            color: "#029BBE"
            border.color: "#ffffff"
            border.width: 0
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 30
            // Calculate position based on content scroll
            y: (adminTotalizercustomSlider.height - adminTotalizerhandle.height) * (flickableContent.contentY / (flickableContent.contentHeight - flickableContent.height))
            MouseArea {
                id:settingMouseAreabtn
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                drag.target: parent
                drag.axis: Drag.Y
                drag.minimumY: 0
                drag.maximumY: adminTotalizercustomSlider.height - adminTotalizerhandle.height
                onReleased: {
                    // Sync adminTotalizerhandle's position with content scroll when drag stops
                    flickableContent.contentY = (adminTotalizerhandle.y / (adminTotalizercustomSlider.height - adminTotalizerhandle.height)) * (flickableContent.contentHeight - flickableContent.height)
                }
                onPositionChanged: {
                    // Update content scroll position during drag
                    flickableContent.contentY = (adminTotalizerhandle.y / (adminTotalizercustomSlider.height - adminTotalizerhandle.height)) * (flickableContent.contentHeight - flickableContent.height)
                }
            }
        }
    }

}






    Rectangle{
        x:0
        y:582
        height: 138
        width: 2560
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#030317BF"
            }
            GradientStop {
                position: 1
                color: "#000014"
            }
        }
//        Row{

            Rectangle {
                width: 586
                height: 82
                x:309
                y: 24
                color: "#00ffffff"
                radius: 12
                border.color: "#ffffff"
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("EXIT")
                    font.pixelSize: 32
                    font.weight: Font.Bold
                    font.family: "Roboto Condensed"
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        pageLoader.source = "Mainconsol.qml"
                    }
                }
            }
        }
//    }




}


//    adminTotalizerscrollView {
//        width: 500
//        height: 500
//        clip: true  // Clips content to the bounds of the adminTotalizerscrollView

//        Flickable {
//            id: flickableContent2
//            contentWidth: parent.width
//            contentHeight: contentColumn.height  // Set to column height for vertical scroll

//            Column {
//                id: contentColumn
//                width: flickableContent2.width
//                spacing: 16

//                // Dynamically create items
//                Repeater {
//                    model: 70  // Number of items to display
//                    Rectangle {
//                        width: parent.width - 20
//                        height: 100
//                        radius: 8
//                        color: index % 2 === 0 ? "#3498db" : "#1abc9c"  // Alternating colors
//                        border.color: "#2980b9"

//                        Text {
//                            anchors.centerIn: parent
//                            text: "Item " + (index + 1)
//                            font.pointSize: 20
//                            color: "#ffffff"
//                        }
//                    }
//                }
//            }
//        }
//    }
