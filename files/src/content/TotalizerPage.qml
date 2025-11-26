import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Item {
    width: 1859 //Constants.width
    height: 454 //Constants.height
    x:230
    y:152
            property int loaderIconTimeoutValue

    Rectangle{
        //        x:0
        //        y:0
        //        width: Constants.width
        //        height: Constants.height
        width: 1859 //Constants.width
        height: 454 //Constants.height
        color: "#9f01051c"
        radius: 40
        border.color: "#ffffff"



        //        gradient: Gradient {
        //            orientation: Gradient.Horizontal
        //            GradientStop {
        //                position: 0
        //                color: "#9c000426"
        //            }
        //            GradientStop {
        //                position: 0.5
        //                color: "#000014"
        //            }
        //            GradientStop {
        //                position: 1
        //                color: "#000426"
        //            }
        //        }


        //    }




        //                BackgroundDimmer {
        //                    id: backgroundDimmer  // This will dim the background of inactive components
        ////                    height: 500
        ////                    width: 800
        //        //            x:-200
        //        //            y:-100
        //        //            anchors.centerIn: dataBaseoverwriteid.Center
        //                    visible:  false
        //                    property var diactiveAreaId
        ////                    anchors.fill: parent
        //                                        height: parent.height
        //                                        width: parent.width
        //                    z:0
        //                    onInactiveareaclicked: {
        //                        console.log("Inactive area clicked")
        //                    }
        //                }


        Item {
            id:settingscrollwindow
            //        x:230
            //        y:152
            width: parent.width
            height: parent.height

            ScrollView {
                x:0
                y:0
                id: scrollView
                width: parent.width //- 20
                height: settingscrollwindow.parent.height-74//  400//parent.height-32
                anchors.centerIn: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                Flickable {
                    id: flickableContent
                    contentWidth: parent.width
                    contentHeight: totalizerlist.height// generalTabcontent.height//+120

                    Column{
                        id:totalizerlist
                        spacing: 23
                        Row{
                            x:23
                            height: 74
                            Image {

                                source: "images/Group 252 1.png"
                                fillMode: Image.PreserveAspectFit
                            }
                            Text {
                                color: "#ffffff"
                                text: qsTr("TOTALIZERS")
                                font.pointSize: 40
                                font.family: "Roboto"
                            }
                        }


                        Row {
                        x: 23
                        spacing: 23

                        Column {
                        width: (scrollView.width-23-128)/2
                        Column {
                        width: parent.width
                        Rectangle {
                            id: rectangle
                        width: parent.width
                        height: 138.04
                        color: "#00000000"
                        radius: 12
                        border.color: "#117bb1"
                        border.width: 2
                        Row {
                        x: 27
                        anchors.verticalCenter: parent.verticalCenter
                        Image {
                        anchors.verticalCenter: parent.verticalCenter
                        source: "images/sliders 1.png"
                        }

                        Text {
                        x: 58
                        y: 44
                        color: "#0fe6ef"
                        text: "Number of Journeys"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -1.5
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        }
                        spacing: 28
                        }

                        Row {
                            id: row
                        x: 493
//                        width: 397
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 32
                        Text {
                            id:numberofJourneysid
                        x: 74
                        y: 44
                        width: 266
                        color: "#ffffff"
                        text: "1250.3381"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        font.letterSpacing: -4.4
                        font.pixelSize: 62
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        anchors.rightMargin: 32
                        font.family: "Roboto Condensed"
                        Connections {
                            target: appUi
                            onSystem_NumberofJourneys: {
                                numberofJourneysid.text = NumberofJourneysValue
                            }
                        }
                        }

//                        Text {
//                        y: 44
//                        color: "#ffffff"
//                        text: distanceUnit
//                        anchors.verticalCenter: parent.verticalCenter
//                        font.letterSpacing: -1
//                        font.pixelSize: 62
//                        horizontalAlignment: Text.AlignRight
//                        verticalAlignment: Text.AlignVCenter
//                        font.family: "Roboto Condensed"
//                        }
                        spacing: 10
                        }
                        }

                        Rectangle {
                            id: rectangle1
                        width: parent.width
                        height: 138.04
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
                        }
                        spacing: 28
                        }

                        Row {
                            x: 493
//                            width: 397
                            anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 56
                        Text {
                            id:totalDistanceTraveledWhenHiredid
                        x: 74
                        y: 44
                        width: 266
                        color: "#ffffff"
                        text: "1250.3381"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 62
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"

                        Connections {
                            target: appUi
                            onSystem_totalDistanceTraveledWhenHired: {
                                totalDistanceTraveledWhenHiredid.text = totalDistanceTraveledWhenHiredValue
                            }
                        }

                        }

                        Text {
                            y: 44
                            width: 100
                            color: "#ffffff"
                        text: distanceUnit
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 62
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"
                        }
                        spacing: 10
                        }
                        }

                        Rectangle {
                            id: rectangle5
                        width: parent.width
                        height: 138.04
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
                        width: parent.parent.width/2.5
                        color: "#0fe6ef"
                        text: "Distance Traveled By\nThe Taxi"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -1.5
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        }
                        spacing: 28
                        }

                        Row {
                        x: 493
                        //                        width: 397
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 56
                        Text {
                            id:totalDistanceTraveledbyTheTaxiid
                        x: 74
                        y: 44
                        width: 266
                        color: "#ffffff"
                        text: "1250.3381"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 62
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"

                        Connections {
                            target: appUi
                            onSystem_totalDistanceTraveledbyTheTaxi: {
                                totalDistanceTraveledbyTheTaxiid.text = totalDistanceTraveledbyTheTaxiValue
                            }
                        }
                        }

                        Text {
                            y: 44
                            width: 100
                            color: "#ffffff"
                        text: distanceUnit
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 62
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"
                        }
                        spacing: 10
                        }
                        }
                        spacing: 32
                        }
                        spacing: 32
                        }

                        Column {
                        width: (scrollView.width-23-128)/2
                        Column {
                        width: parent.width
                        Rectangle {
                            id: rectangle2
                        width: parent.width
                        height: 138.04
                        color: "#00000000"
                        radius: 12
                        border.color: "#117bb1"
                        border.width: 2
                        Row {
                        x: 27
                        anchors.verticalCenter: parent.verticalCenter
                        Image {
                        anchors.verticalCenter: parent.verticalCenter
                        source: "images/add-text-line 1.png"
                        }

                        Text {
                        x: 58
                        y: 44
                        color: "#0fe6ef"
                        text: "Money Charged \n[Supplements]"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -1.5
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        }
                        spacing: 28
                        }

                        Row {
                        x: 493
//                        width: 397
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 56
                        Text {
                            id:moneyChargedSupplementsid
                        x: 74
                        y: 44
                        width: 266
                        color: "#ffffff"
                        text: "1250.3381"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 72
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"

                        Connections {
                            target: appUi
                            onSystem_MoneyChargedSupplements: {
                                moneyChargedSupplementsid.text = MoneyChargedSupplementsValue
                            }
                        }


                        }

                        Text {
                            y: 44
                            width: 100
                            color: "#ffffff"
                        text: currencyUnit
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 72
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"
                        }
                        spacing: 10
                        }
                        }

                        Rectangle {
                            id: rectangle3
                        width: parent.width
                        height: 138.04
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
                        width: 292
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
                        //                        width: 397
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 56
                        Text {
                            id:moneyChargedFareid
                        x: 74
                        y: 44
                        width: 266
                        color: "#ffffff"
                        text: "1250.3381"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 72
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"

                        Connections {
                            target: appUi
                            onSystem_MoneyChargedFare: {
                                moneyChargedFareid.text = MoneyChargedFareValue
                            }
                        }


                        }

                        Text {
                            y: 44
                            width: 100
                            color: "#ffffff"
                        text: currencyUnit
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 72
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"
                        }
                        spacing: 10
                        }
                        }

                        Rectangle {
                            id: rectangle4
                        width: parent.width
                        height: 138.04
                        color: "#00000000"
                        radius: 12
                        border.color: "#117bb1"
                        border.width: 2
                        Row {
                        x: 27
                        anchors.verticalCenter: parent.verticalCenter
                        Image {
                        anchors.verticalCenter: parent.verticalCenter
                        source: "images/add-text-line 1.png"
                        }

                        Text {
                        x: 58
                        y: 44
                        color: "#0fe6ef"
                        text: "Total Idle Distance"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -1.5
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        }
                        spacing: 28
                        }

                        Row {
                        x: 493
                        //                        width: 397
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 56
                        Text {
                            id :totalIdleDistanceid
                        x: 74
                        y: 44
                        width: 266
                        color: "#ffffff"
                        text: "1250.3381"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 72
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"
                        Connections {
                            target: appUi
                            onSystem_TotalIdleDistance: {
                                totalIdleDistanceid.text = TotalIdleDistanceValue
                            }
                        }
                        }

                        Text {
                            y: 44
                        width: 100
                        color: "#ffffff"
                        text: distanceUnit
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -4.4
                        font.pixelSize: 72
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.family: "Roboto Condensed"
                        }
                        spacing: 10
                        }
                        }


                        spacing: 32
                        }
                        spacing: 32
                        }
                        }



                    }
                }
            }
        }

        Rectangle {
            id: customSlider
            x: 1803
            y: 10
            width: 20
            height: scrollView.height
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            Rectangle {
                width: 16
                height: parent.height
                anchors.centerIn: parent
                color: "#082F43"
                radius: 90
                border.width: 0
            }

            // Rectangular Handle (draggable knob)
            Rectangle {
                id: handle
                width: 32
                height: 230   // Make the handle taller for better interaction
                color: "#029BBE"
                border.color: "#ffffff"
                border.width: 0
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 30
                // Calculate position based on content scroll
                y: (customSlider.height - handle.height) * (flickableContent.contentY / (flickableContent.contentHeight - flickableContent.height))
                MouseArea {
                    id:settingMouseAreabtn
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    drag.target: parent
                    drag.axis: Drag.Y
                    drag.minimumY: 0
                    drag.maximumY: customSlider.height - handle.height
                    onReleased: {
                        // Sync handle's position with content scroll when drag stops
                        flickableContent.contentY = (handle.y / (customSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
                    }
                    onPositionChanged: {
                        // Update content scroll position during drag
                        flickableContent.contentY = (handle.y / (customSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
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
            x: 1707
            y: 26
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

    //    Rectangle{
    //        x:0
    //        y:582
    //        height: 138
    //        width: 2560
    ////        color: "#030317BF"
    //        gradient: Gradient {
    //            orientation: Gradient.Horizontal
    //            GradientStop {
    ////                id:/*hireButtonGrad1a*/
    //                position: 0
    //                color: "#030317BF"
    //            }
    //            GradientStop {
    ////                id:hireButtonGrad1b
    //                position: 1
    //                color: "#000014"
    //            }
    //        }
    //Row{
    //    id: configurationPageexitButton

    //    x:231
    //    y: 24
    //    spacing: 10
    //        Rectangle {
    ////            id: configurationPageexitButton
    ////            x: 231
    ////            y: 24
    //            width: 586
    //            height: 82
    //            color: "#00ffffff"
    //            radius: 12
    //            border.color: "#ffffff"
    //            border.width: 1
    //            Text {
    ////                id: text1
    //                anchors.centerIn: parent
    //                color: "#ffffff"
    //                text: qsTr("EXIT")
    //                font.pixelSize: 32
    //                font.weight: Font.Bold
    //                font.family: "Roboto Condensed"
    //            }
    //            MouseArea{
    ////                id: settingExitbuttonArea
    //                anchors.fill: parent
    //                cursorShape: Qt.PointingHandCursor
    //                onClicked: {
    ////                    hireConsole.visible=true
    ////                    tabscoslewndw.visible=true
    ////                    settingoagewindowe.visible=false
    ////                    mainWindowLoader.source = "Mainconsol.qml"
    //                    pageLoader.source = "Mainconsol.qml"

    //                }
    //            }
    //        }
    //    }
    //    }

    //    MyKeyBoard {
    //        id: myKeyBoard
    //        x: 0
    //        y: 0
    //    }
}


//    ScrollView {
//        width: 500
//        height: 500
//        clip: true  // Clips content to the bounds of the ScrollView

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
