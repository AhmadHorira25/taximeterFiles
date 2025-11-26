import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Item {
    id:settingoagewindowe
    width: Constants.width
    height: Constants.height

//    property var adminLogginPageBuf: adminLogginPage




//    Component{
//        id:adminLogginPage
//        LogginPage{  // "LogginPage.qml"
//                     loginTargetPage:  "AddminPage.qml"
//                     z:20
//            }
//    }




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

    Item {
        id:settingscrollwindow
        x:309
        y:157
        width: 1943
        height: 420
        ScrollView {
            x:0
            y:0
            id: scrollView
            width: parent.width - 20
            height: parent.height
            clip: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff


            Flickable {
                x:0
                y:0
                id: flickableContent
                contentWidth: parent.width
                contentHeight: columnContent.height

                Column {
                    x:0
                    y:0
                    id: columnContent
                    width: scrollView.width
                    spacing: 32
                    Rectangle {
                        width: settingscrollwindow.width * 0.965517241// - 0.034482759 *settingscrollwindow.width
                        height: 138.04
                        color: "transparent"
                        radius: 8
                        border.color: "#117BB1"
                        border.width: 2
                        Row{
                            spacing: 28
                            height: 65
                            width: 498
                            anchors.verticalCenter: parent.verticalCenter
                            x:56
                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                source: "images/Group 199 1.png"
                            }
                            Text {
                                width: 126
                                height: 47
                                anchors.verticalCenter: parent.verticalCenter
                                text: "My Profile"
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Roboto"
                                font.pointSize: 40
                                color: "#ffffff"
                            }
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                pageLoader.source = "LogginPage.qml"
                            }
                        }
                        Image {
                            anchors.right : parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            source: "images/enterVector.png"
                            anchors.verticalCenterOffset: 0
                            anchors.rightMargin: 73
                        }

                    }
                    Rectangle {
                        width: settingscrollwindow.width * 0.965517241// - 0.034482759 *settingscrollwindow.width
                        height: 138.04
                        color: "transparent"
                        radius: 8
                        border.color: "#117BB1"
                        border.width: 2
                        Row{
                            spacing: 28
                            height: 65
                            width: 498
                            anchors.verticalCenter: parent.verticalCenter
                            x:56
                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                source: "images/Group 181 1.png"
                            }
                            Text {
                                width: 126
                                height: 47
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Facial Recognition"
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Roboto"
                                font.pointSize: 40
                                color: "#ffffff"

                            }
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                pageLoader.source = "LogginPage.qml"
                            }
                        }
                        Image {
                            anchors.right : parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            source: "images/enterVector.png"
                            anchors.verticalCenterOffset: 0
                            anchors.rightMargin: 73
                        }

                    }
                    Rectangle {
                        width: settingscrollwindow.width * 0.965517241// - 0.034482759 *settingscrollwindow.width
                        height: 138.04
                        color: "transparent"
                        radius: 8
                        border.color: "#117BB1"
                        border.width: 2
                        Row{
                            spacing: 28
                            height: 65
                            width: 498
                            anchors.verticalCenter: parent.verticalCenter
                            x:56
                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                source: "images/tabler_help.png"
                            }
                            Text {
                                width: 126
                                height: 47
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Help"
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Roboto"
                                font.pointSize: 40
                                color: "#ffffff"

                            }
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                pageLoader.source = "LogginPage.qml"
                            }
                            Image {
                                anchors.right : parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                source: "images/enterVector.png"
                                anchors.verticalCenterOffset: 0
                                anchors.rightMargin: 73
                            }
                        }

                    }
                    Rectangle {
                        width: settingscrollwindow.width * 0.965517241// - 0.034482759 *settingscrollwindow.width
                        height: 138.04
                        color: "transparent"
                        radius: 8
                        border.color: "#117BB1"
                        border.width: 2
                        Row{
                            spacing: 28
                            height: 65
                            width: 498
                            anchors.verticalCenter: parent.verticalCenter
                            x:56
                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                source: "images/Group 198.png"
                            }
                            Text {
                                width: 126
                                height: 47
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Logout"
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Roboto"
                                font.pointSize: 40
                                color: "#ffffff"

                            }
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                pageLoader.source = "LogginPage.qml"
                            }
                        }
                        Image {
                            anchors.right : parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            source: "images/enterVector.png"
                            anchors.verticalCenterOffset: 0
                            anchors.rightMargin: 73
                        }

                    }
                }
            }
        }

        Rectangle {
            id: customSlider
            x: 1910
            y: 0
            width: 20
            height: scrollView.height
            anchors.right: parent.right
            anchors.rightMargin: 13
            color: "transparent"

            // Groove (background track)
            Rectangle {
                //                x: scrollView.width-32
                //                y:4
                width: 16
                height: parent.height
                anchors.centerIn: parent
                color: "#082F43"
                radius: 90
                border.width: 0
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0


            }

            // Rectangular Handle (draggable knob)
            Rectangle {
                id: handle
                x: -7
                width: 32
                height: 230   // Make the handle taller for better interaction
                color: "#029BBE"
                border.color: "#ffffff"
                border.width: 0
                radius: 30


                // Calculate position based on content scroll
                y: (customSlider.height - handle.height) * (flickableContent.contentY / (flickableContent.contentHeight - flickableContent.height))

                MouseArea {
                    id:settingMouseAreabtn
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.Y
                    drag.minimumY: 0
                    drag.maximumY: customSlider.height - handle.height

                    onReleased: {
                        // Sync handle's position with content scroll when drag stops
                        flickableContent.contentY = (handle.y / (customSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
                        handle.x=-7
                    }

                    onPositionChanged: {
                        // Update content scroll position during drag
                        flickableContent.contentY = (handle.y / (customSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
                        handle.x=-7
                    }
                }
            }
        }
        // Custom Slider with Groove and Rectangular Handle


    }


    Row{
        x:72
        y:35
        height: 74
        spacing: 10
        Image {
            source: "images/Group 254 1.png"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            color: "#ffffff"
            text: qsTr("SETTINGS")
            font.pointSize: 28
            font.family: "Encode Sans"
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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

        Rectangle {
            x: 309
            y: 24
            width: 586
            height: 82
            color: "#00ffffff"
            radius: 12
            border.color: "#ffffff"
            border.width: 2

            Text {
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
                    pageLoader.source = "Mainconsol.qml"

                }
            }

        }

        Rectangle {
            x: 2092
            y: 16
            width: 102
            height: 99
            color: "#00ffffff"
            radius: 12
            border.color: "#0fe6ef"
            Image {
                x: 23
                y: 18
                source: "images/Group 205.png"
                fillMode: Image.PreserveAspectFit
            }


            Timer {
                id: myTimer
                property int secretpushCounter: 0
                property int tickCounter: 0
                property int holdTimer: 0
                property bool holdTimerflag: false
                interval: 100 // in milliseconds (1 second)
                repeat: true   // true = repeats, false = triggers once
                running: true  // true = starts automatically
                onTriggered: {
                    myTimer.tickCounter=myTimer.tickCounter+1
                }




                onTickCounterChanged: {
                    if(myTimer.tickCounter>5){
                        if(myTimer.holdTimerflag===false){
                        myTimer.secretpushCounter = 0
                        myTimer.tickCounter=0
                        }
                    }
                    if((myTimer.tickCounter-myTimer.holdTimer)>10){
                        pageLoader.source = "LogginPage.qml"
                        pageLoader.item.loginTargetPage=  "AddminPage.qml"
                        pageLoader.item.gotoMainVisible=  true

//                        var rect = Qt.createQmlObject('import QtQuick 2.15; Rectangle { width: 100; height: 50; color: "lightblue"; anchors.centerIn: parent; }',
//                                                          pageLoader.item,
//                                                          "DynamicRectangle");
//                        pageLoader.source = null
//                        pageLoader.sourceComponent = settingoagewindowe.adminLogginPageBuf // adminLogginPage// "AddminPage.qml"

                    }
                }

            }


            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
//                onClicked: {
//                }
                onPressed: {
                    myTimer.start()
                   myTimer.secretpushCounter = myTimer.secretpushCounter+1
//                    pageLoader.source = "AddminPage.qml"
                    if(myTimer.secretpushCounter===4){
                        myTimer.holdTimer=myTimer.tickCounter
                        myTimer.holdTimerflag=true
                    }

                   myTimer.tickCounter=0
                }
                onReleased: {
                    myTimer.holdTimer=0
                    myTimer.holdTimerflag=false
                }

            }

        }


    }




}
