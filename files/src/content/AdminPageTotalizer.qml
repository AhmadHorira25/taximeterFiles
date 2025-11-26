import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Item {
    width: Constants.width
    height: Constants.height


    property int loaderIconTimeoutValue

    Component.onCompleted: {
        console.log("Component loaded successfully!");
        totalizerTimerId.start()
        // Perform actions here
    }

    Timer {
        id: totalizerTimerId
        property int secretpushCounter: 0
        property int tickCounter: 0
        property int holdTimer: 0
        property bool holdTimerflag: false
        interval: 10 // in milliseconds (1 second)
        repeat: true   // true = repeats, false = triggers once
        running: true  // true = starts automatically
        onTriggered: {
            totalizerTimerId.tickCounter=totalizerTimerId.tickCounter+1
            if(totalizerTimerId.tickCounter>1000){
                totalizerTimerId.tickCounter=0
                 pageLoader.source = "Mainconsol.qml"
            }else{
                loaderIconTimeoutValue = (1000-totalizerTimerId.tickCounter)/10
            }
        }
    }






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
            source: "images/Group 252 1.png"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            color: "#ffffff"
            text: qsTr("TOTALIZERS")
            font.family: "Roboto"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Item {
        id:settingscrollwindow
        width: 1943
        height: 420
        x:309
        y:157
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
                contentHeight: totalizerlist.height

                Column{
                    id:totalizerlist
                    spacing: 23


                    Row{
                        x:23
                        spacing: 23
                        Column {
                            spacing: 32
                            width: (adminTotalizerscrollView.width-23-128)/2

                            Column {
                                width:parent.width
                                //            width: 2100 // hardwaresettingTabcontent.width //- adminTotalizerscrollView.width* 0.05
                                spacing: 32
                                Rectangle {
                                    id: rectangle
                                    width: parent.width //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
                                    height: 233
                                    color: "transparent"
                                    radius: 12
                                    border.color: "#117BB1"
                                    border.width: 2
                                    Row{
                                        x:27
                                        anchors.verticalCenter: parent.verticalCenter
                                        spacing:28
                                        Image {
                                            source: "images/sliders 1.png"
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        Text {
                                        x: 58
                                        y: 44
                                        //                                anchors.centerIn: parent
                                        text: "Number of Journeys"
                                        font.pixelSize: 40
                                        verticalAlignment: Text.AlignVCenter
                                        font.family: "Roboto"
                                        color: "#0fe6ef"
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.letterSpacing: -1.5
                                        }
                                    }
                                    Row{
                                        id: row
                                        x:493
                                        width: 397
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 30
                                        spacing:10

                                        Text {
                                            id:adminnumberofJourneysid
                                            x: 74
//                                        x: 493
                                            y: 44
                                            width: 266
                                        //                                anchors.centerIn: parent
                                        text: "2501.3381"
                                        font.pixelSize: 62
                                        horizontalAlignment: Text.AlignRight
                                        verticalAlignment: Text.AlignVCenter
                                        anchors.rightMargin: 30
                                        font.family: "Roboto Condensed"
                                        color: "#ffffff"
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        font.letterSpacing: -3.4
                                        Connections {
                                            target: appUi
                                            onSystem_NumberofJourneys: {
                                                adminnumberofJourneysid.text = NumberofJourneysValue
                                            }
                                        }
                                        }
                                    }


                                }

                                Rectangle {
                                    id: rectangle3
                                    width: parent.width
                                    height: 233
                                    color: "#00000000"
                                    radius: 12
                                    border.color: "#117bb1"
                                    border.width: 2
                                    Row {
                                        x: 27
                                        anchors.verticalCenter: parent.verticalCenter
                                        Image {
                                            anchors.verticalCenter: parent.verticalCenter
                                            source: "images/Group 118 1.png"
                                        }

                                        Text {
                                            x: 58
                                            y: 44
                                            width: 350
                                            color: "#0fe6ef"
                                            text: "Money Charged [Fare]"
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.letterSpacing: -1.5
                                            font.pixelSize: 40
                                            verticalAlignment: Text.AlignVCenter
                                            wrapMode: Text.WordWrap
                                            font.family: "Roboto"
                                        }
                                        spacing: 28
                                    }

                                    Row {
                                        x: 493
                                        width: 397
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        Text {
                                            id:adminmoneyChargedFareid
                                            x: 74
                                            y: 44
                                            width: 266
                                            color: "#ffffff"
                                            text: "2501.3381"
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.letterSpacing: -3.4
                                            font.pixelSize: 62
                                            horizontalAlignment: Text.AlignRight
                                            verticalAlignment: Text.AlignVCenter
                                            Connections {
                                                target: appUi
                                                onSystem_MoneyChargedFare: {
                                                                                    adminmoneyChargedFareid.text = MoneyChargedFareValue
                                                                                }
                                            }
                                            font.family: "Roboto Condensed"
                                        }

                                        Text {
                                            y: 44
                                            width: 100
                                            color: "#ffffff"
                                            text: currencyUnit
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.letterSpacing: -3.1
                                            font.pixelSize: 62
                                            horizontalAlignment: Text.AlignLeft
                                            verticalAlignment: Text.AlignVCenter
                                            font.family: "Roboto Condensed"
                                        }
                                        spacing: 10
                                        anchors.rightMargin: 30
                                    }
                                }


                            }






                        }


                        Column {
                            spacing: 32
                            width: (adminTotalizerscrollView.width-23-128)/2
                            Column {
                                width:parent.width
                                spacing: 32

//                                Rectangle {
//                                    id: rectangle4
//                                    width: parent.width
//                                    height: 309 //* 0.965517241/2 - adminTotalizerscrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
//                                    color: "transparent"
//                                    radius: 12
//                                    border.color: "#117BB1"
//                                    border.width: 2
//                                    Row{
//                                        x:27
//                                        anchors.verticalCenter: parent.verticalCenter
//                                        spacing:28
//                                        Image {
//                                            source: "images/add-text-line 1.png"
//                                            anchors.verticalCenter: parent.verticalCenter
//                                        }

//                                        Text {
//                                        x: 58
//                                        y: 44
//                                        //                                anchors.centerIn: parent
//                                        text: "Money Charged
//[Supplements]"
//                                        font.pixelSize: 40
//                                        verticalAlignment: Text.AlignVCenter
//                                        font.family: "Roboto"
//                                        color: "#0fe6ef"
//                                        anchors.verticalCenter: parent.verticalCenter
//                                        font.letterSpacing: -1.5
//                                        }
//                                    }
//                                    Row{
//                                        x:493
//                                        width: 397
//                                        anchors.verticalCenter: parent.verticalCenter
//                                        anchors.right: parent.right
//                                        anchors.rightMargin: 30
//                                        spacing:10

//                                        Text {
//                                            id:adminmoneyChargedSupplementsid
//                                            x: 74
////                                        x: 493
//                                            y: 44
//                                            width: 266
//                                        //                                anchors.centerIn: parent
//                                        text: "2501.3381"
//                                        font.pixelSize: 62
//                                        horizontalAlignment: Text.AlignRight
//                                        verticalAlignment: Text.AlignVCenter
//                                        font.family: "Roboto Condensed"
//                                        color: "#ffffff"
//                                        anchors.verticalCenter: parent.verticalCenter
//                                        font.letterSpacing: -3.1
//                                        Connections {
//                                            target: appUi
//                                            onSystem_MoneyChargedSupplements: {
//                                                adminmoneyChargedSupplementsid.text = MoneyChargedSupplementsValue
//                                            }
//                                        }
//                                        }

//                                        Text {
//                                            y: 44
//                                            width: 100
//                                            text: currencyUnit
//                                            font.pixelSize: 62
//                                            horizontalAlignment: Text.AlignLeft
//                                            verticalAlignment: Text.AlignVCenter
//                                            font.family: "Roboto Condensed"
//                                            color: "#ffffff"
//                                            anchors.verticalCenter: parent.verticalCenter
//                                            font.letterSpacing: -3.1
//                                        }
//                                    }


//                                }
                                Rectangle {
                                    id: rectangle1
                                    width: parent.width
                                    height: 233
                                    color: "#00000000"
                                    radius: 12
                                    border.color: "#117bb1"
                                    border.width: 2
                                    Row {
                                        x: 27
                                        anchors.verticalCenter: parent.verticalCenter
                                        Image {
                                            anchors.verticalCenter: parent.verticalCenter
                                            source: "images/Group 118 1.png"
                                        }

                                        Text {
                                            x: 58
                                            y: 44
                                            width: parent.parent.width/2.5
                                            color: "#0fe6ef"
                                            text: "Distance Traveled When Hired"
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.letterSpacing: -1.5
                                            font.pixelSize: 40
                                            verticalAlignment: Text.AlignVCenter
                                            wrapMode: Text.WordWrap
                                            font.family: "Roboto"
                                            style: Text.Outline
                                        }
                                        spacing: 28
                                    }

                                    Row {
                                        x: 493
                                        width: 397
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        Text {
                                            id:admintotalDistanceTraveledWhenHiredid
                                            x: 74
                                            y: 44
                                            width: 266
                                            color: "#ffffff"
                                            text: "2501.3381"
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.letterSpacing: -3.4
                                            font.pixelSize: 62
                                            horizontalAlignment: Text.AlignRight
                                            verticalAlignment: Text.AlignVCenter
                                            Connections {
                                                target: appUi
                                                onSystem_totalDistanceTraveledWhenHired: {
                                                                                admintotalDistanceTraveledWhenHiredid.text = totalDistanceTraveledWhenHiredValue
                                                                            }
                                            }
                                            font.family: "Roboto Condensed"
                                        }

                                        Text {
                                            y: 44
                                            width: 100
                                            color: "#ffffff"
                                            text: distanceUnit
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.letterSpacing: -3.1
                                            font.pixelSize: 62
                                            horizontalAlignment: Text.AlignLeft
                                            verticalAlignment: Text.AlignVCenter
                                            font.family: "Roboto Condensed"
                                        }
                                        spacing: 10
                                        anchors.rightMargin: 30
                                    }
                                }
                                Rectangle {
                                id: rectangle2
                                width: parent.width
                                height: 233
                                color: "#00000000"
                                radius: 12
                                border.color: "#117bb1"
                                border.width: 2

                                Row {
                                x: 27
                                anchors.verticalCenter: parent.verticalCenter
                                Image {
                                anchors.verticalCenter: parent.verticalCenter
                                source: "images/Group 178 1.png"
                                }

                                Text {
                                x: 58
                                y: 44
                                width: 340
                                color: "#0fe6ef"
                                text: "Distance Traveled By The Taxi"
                                anchors.verticalCenter: parent.verticalCenter
                                font.letterSpacing: -2
                                font.pixelSize: 40
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.family: "Roboto"
                                }
                                spacing: 28
                                }

                                Row {
                                x: 493
                                width: 397
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                Text {
                                id: admintotalDistanceTraveledbyTheTaxiid
                                x: 74
                                y: 44
                                width: 266
                                color: "#ffffff"
                                text: "2501.3381"
                                anchors.verticalCenter: parent.verticalCenter
                                font.letterSpacing: -3.4
                                font.pixelSize: 62
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                                Connections {
                                target: appUi
                                onSystem_totalDistanceTraveledbyTheTaxi: {
                                                                                    admintotalDistanceTraveledbyTheTaxiid.text = totalDistanceTraveledbyTheTaxiValue
                                                                                }
                                }
                                font.family: "Roboto Condensed"
                                }

                                Text {
                                y: 44
                                width: 100
                                color: "#ffffff"
                                text: distanceUnit
                                anchors.verticalCenter: parent.verticalCenter
                                font.letterSpacing: -3.1
                                font.pixelSize: 62
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Roboto Condensed"
                                }
                                spacing: 10
                                anchors.rightMargin: 30
                                }
                                }
                            }






                        }
                    }


                }
            }
        }
    }

    Rectangle {
        id: adminTotalizercustomSlider
        x: 2195
        y: 10
        width: 20
        height: adminTotalizerscrollView.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
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
        Row{
            x:231
            y: 24
            Rectangle {
                width: 586
                height: 82
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
//                        pageLoader.source = "AddminPage.qml"


                    }
                }
            }
        }
    }



    Rectangle{
        width: 62
        height: 74
        color: "#9f01051c"
        radius: 20
        border.width: 0
        x: 2086
        y: 152
        LoodingIcon{
            //            x: 1719
            //            y: 44
            anchors.centerIn: parent
            currentValue:loaderIconTimeoutValue //testinput.value
//                anchors.fill: parent
            width: 52
            height: 52
        }

    }

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
