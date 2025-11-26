import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Item {
    width: Constants.width
    height: Constants.height


//
    Component.onCompleted: {
//        console.log("Item is fully loaded!");
       appUi.uiAuditTrailsWindow("opened")
        // Initialize or trigger actions here
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
            source: "images/Group 253 1.png"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            color: "#ffffff"
            text: qsTr("AUDIT Trail")
            font.family: "Roboto"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
    Row{
        width: parent.width
        height: 420
        x:100
        y:157
        spacing: 32

        Item {
            width: 2350
            height: 420
            ScrollView {
                id:userLoggsascrollView
                width: parent.width
                height: 420
                anchors.centerIn: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                Flickable {
                    id: userLoggsflickableContent
                    contentWidth: parent.width
                    contentHeight: userLoggslist.height

                    Column{
                        spacing: 32
                        id: userLoggslist
                        Row{
                            id: row
                            spacing: 28
                        Text {
                            text: "No."
                            width: 120
                            font.letterSpacing: -1.8
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#ffffff"
                        }

                        Text {
                            text: "Name"
                            width: 250
                            font.letterSpacing: -1.8
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#ffffff"
                        }
                        Text {
                            text: "Date"
                            width: 200
                            font.letterSpacing: -1.8
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#ffffff"
                        }
                        Text {
                            text: "Time"
                            width: 200
                            font.letterSpacing: -1.8
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#ffffff"
                        }
                        Text {
                            width: 1220
                            text: "Changes"
//                            width: 1450
                            font.letterSpacing: -1.8
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                            color: "#ffffff"
                        }

                        Rectangle{
                            width: 180
                            height: 40
                            color: "#bb61e1e6"
                            radius: 15
                            border.color: "#bb61e1e6"
                            border.width: 3
                            anchors.verticalCenter: parent.verticalCenter
                            Text {
                                color: "#ffffff"
                                text: "Filter"
                                anchors.verticalCenter: parent.verticalCenter
                                font.pixelSize: 40
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Roboto Condensed"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            MouseArea{
                                anchors.fill: parent
                                onEntered: {
                                    parent.border.width=0
                                    parent.color="#bb8eecef"
                                }
                                onExited: {
                                    parent.border.width=3
                                    parent.color="#bb61e1e6"
                                }
                                onClicked: {
                                    if(filterWindow.visible===true){
                                    filterWindow.visible=false
                                    }else{
                                        filterWindow.visible=true
                                    }
                                }
                            }
                        }





                        }






                        Rectangle{
                            height: loggsclm.height+loggsclm.spacing*2
                            color: "#00ffffff"
                            radius: 12
                            border.color: "#ffffff"
                            border.width: 2
                            width: 2350

                            Column{
                                id:loggsclm
                                spacing: 32
                                width: parent.width
                            }
                        }
                    }

                }
            }
        }

        Rectangle {
            id: userLoggscustomSlider
            x:1500
//            x: 2243
//            y: 10
            width: 20
            height: userLoggsascrollView.height
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

            // Rectangular userLoggscustomhandle (draggable knob)
            Rectangle {
                id: userLoggscustomhandle
                width: 32
                height:userLoggscustomSlider.height*  userLoggscustomSlider.height/userLoggsflickableContent.contentHeight  //440/(440*(440/userLoggsflickableContent.contentHeight))//   /(userLoggsascrollView.height) )  // 230   // Make the userLoggscustomhandle taller for better interaction
                color: "#029BBE"
                border.color: "#ffffff"
                border.width: 0
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 30
                // Calculate position based on content scroll
                y: (userLoggscustomSlider.height - userLoggscustomhandle.height) * (userLoggsflickableContent.contentY / (userLoggsflickableContent.contentHeight - userLoggsflickableContent.height))
                MouseArea {
                    id:userLoggscustomMouseAreabtn
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    drag.target: parent
                    drag.axis: Drag.Y
                    drag.minimumY: 0
                    drag.maximumY: userLoggscustomSlider.height - userLoggscustomhandle.height
                    onReleased: {
                        // Sync userLoggscustomhandle's position with content scroll when drag stops
                        userLoggsflickableContent.contentY = (userLoggscustomhandle.y / (userLoggscustomSlider.height - userLoggscustomhandle.height)) * (userLoggsflickableContent.contentHeight - userLoggsflickableContent.height)
                    }
                    onPositionChanged: {
                        // Update content scroll position during drag
                        userLoggsflickableContent.contentY = (userLoggscustomhandle.y / (userLoggscustomSlider.height - userLoggscustomhandle.height)) * (userLoggsflickableContent.contentHeight - userLoggsflickableContent.height)
                    }
                }
            }
        }
    }


    Rectangle{
        color: "#c0000000"
        border.width: 0
        anchors.fill: parent
        visible: filterWindow.visible

}
    Rectangle{
        id:filterWindow
        anchors.centerIn: parent
        width: 1054
        height: 285
        visible: false
        color: "#111111"
        radius: 24
        border.color: "#ffffff"
        border.width: 0
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        Column{
            spacing: 64
            anchors.centerIn: parent




        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 80
            Row {
                id: row2
//            x: 41
            anchors.verticalCenter: parent.verticalCenter
//            anchors.verticalCenterOffset: -20
            spacing: 9
            Text {
                color: "#0fe6ef"
                text: qsTr("From  ")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                font.pointSize: 40
            }

            TimeSelectScroll{
                id:databaseStartDate
                state: "dateinput"
                scrollInitDate:timeValue //Qt.formatDateTime(timeValue,"yyyy:MM:dd")
//                        scrollInitDate: timeValue
                onOutputDateChanged:  {
                    console.log(" >> new date 1  :",outputDate)
//                    newApplicationDate=outputDate
                }
            }





//        Rectangle {
//        id: rectangle4
//        width: 83
//        height: 57
//        color: "#00ffffff"
//        radius: 4
//        border.color: "#ffffff"
//        ScrollView {
//        width: 80
//        height: 50
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.horizontalCenter: parent.horizontalCenter
//        clip: true
//        contentItem: ListView {
//        id: dayList
//        onCurrentIndexChanged: {
//                                            newApplicationDAY = currentIndex + 1
//                                            console.log("Day selected:", currentIndex + 1)
//                                        }
//        delegate: Item {
//        width: 80
//        height: 45
//        Text {
//        color: "#ffffff"
//        text: modelData + 1 < 10 ? "0" + (modelData + 1) : modelData + 1
//        font.pixelSize: 50
//        anchors.centerIn: parent
//        font.family: "Roboto Condensed"
//        }
//        }
//        model: 31
//        }
//        }
//        }

//        SpanBoxScroll{
//            width: 83
//            height: 57
//            color: "#00ffffff"
//            radius: 4
//            border.color: "#ffffff"
//            minValue: 0
//            startValue: Qt.formatDateTime(applicationTIMEValue,"yy")//admin
//            maxValue: 31

//            onNewValueChanged: {
//                newApplicationTIMEmon=newValue
//            }

//        }




//        hourList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"HH")
//        minuteList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"mm")
//        secondList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"ss")

//        yearList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"yy")//admin
//        monthList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"MM")
//        dayList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"dd")


//        SpanBoxScroll{
//            width: 100
//            height: 57
//            color: "#00ffffff"
//            radius: 4
//            border.color: "#ffffff"
//            minValue: 2000
//            startValue: Qt.formatDateTime(applicationTIMEValue,"yy")//admin
//            maxValue: 2200
//            onNewValueChanged: {
//                newApplicationTIMEyear=newValue
//            }

//        }




        }


        Row {
            id: row1
//            x: 470
            anchors.verticalCenter: parent.verticalCenter
//        anchors.verticalCenterOffset: -20
        spacing: 20

        Text {
            color: "#0fe6ef"
            text: qsTr("To  ")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 40
            font.family: "Roboto"
            font.pointSize: 40
        }
        TimeSelectScroll{
            id:databaseEndDate
            state: "dateinput"
            scrollInitDate:timeValue //Qt.formatDateTime(timeValue,"yyyy:MM:dd")
//                        scrollInitDate: timeValue
                onOutputDateChanged:  {
                    console.log("  >> new date 2 : ",outputDate)
//                    newApplicationDate=outputDate
//                    var timeLimitsArray=[ databaseEndDate.outputDate,databaseStartDate.outputDate]
//                    appUi.uiGetDatabaseByDate(timeLimitsArray)

                }
        }



//        Rectangle {
//        id: rectangle4
//        width: 83
//        height: 57
//        color: "#00ffffff"
//        radius: 4
//        border.color: "#ffffff"
//        ScrollView {
//        width: 80
//        height: 50
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.horizontalCenter: parent.horizontalCenter
//        clip: true
//        contentItem: ListView {
//        id: dayList
//        onCurrentIndexChanged: {
//                                            newApplicationDAY = currentIndex + 1
//                                            console.log("Day selected:", currentIndex + 1)
//                                        }
//        delegate: Item {
//        width: 80
//        height: 45
//        Text {
//        color: "#ffffff"
//        text: modelData + 1 < 10 ? "0" + (modelData + 1) : modelData + 1
//        font.pixelSize: 50
//        anchors.centerIn: parent
//        font.family: "Roboto Condensed"
//        }
//        }
//        model: 31
//        }
//        }
//        }

//        SpanBoxScroll{
//            width: 83
//            height: 57
//            color: "#00ffffff"
//            radius: 4
//            border.color: "#ffffff"
//            minValue: 0
//            startValue: Qt.formatDateTime(applicationTIMEValue,"yy")//admin
//            maxValue: 31

//            onNewValueChanged: {
//                newApplicationTIMEmon=newValue
//            }

//        }




//        hourList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"HH")
//        minuteList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"mm")
//        secondList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"ss")

//        yearList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"yy")//admin
//        monthList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"MM")
//        dayList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"dd")




        }
        }

        Row{
            spacing: 8
            anchors.horizontalCenter: parent.horizontalCenter
            y:180
            width: 966
            height: 74




        Rectangle{
            id: rectangle
            color: "#00ffffff"
            radius: 5
            border.color: "#ffffff"
            border.width: 1
            width: 478
            height: 74
            Text {
                width: 84
                height: 39
                anchors.centerIn: parent
                color: "#ffffff"
                text: "Cancel"
                font.pixelSize: 26
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.7
                font.family: "Roboto"
                anchors.verticalCenterOffset: -2
                anchors.horizontalCenterOffset: 0
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
               onClicked: {
                   filterWindow.visible=false
               }
            }
        }

        Rectangle{
            color: "#029BBE"
            radius: 5
            border.color: "#029bbe"
            border.width: 0
            width: 478
            height: 74
            Text {
                color: "#ffffff"
                text: "submit"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
//                    parent.border.width=0
                    parent.color="#d2029BBE"
//                    border.color= "#d2029BBE"
                }
                onExited: {
//                    parent.border.width=3
                    parent.color="#029BBE"
                }
                onClicked: {
                    if(filterWindow.visible===true){
                    filterWindow.visible=false
                    }else{
                        filterWindow.visible=true
                    }
                    var timeLimitsArray=[ databaseEndDate.outputDate,databaseStartDate.outputDate]

                    console.log(" >>> databaseEndDate.outputDate = ",databaseEndDate.outputDate)


                    for (let i = loggsclm.children.length - 1; i >= 0; i--) {
                        loggsclm.children[i].destroy();
                    }
                    appUi.uiGetDatabaseByDate(timeLimitsArray)

//                    databaseStartDate.outputDate
//                    databaseEndDate.outputDate
                }
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
//                    pageLoader.source = "Mainconsol.qml"
                    pageLoader.source = "AddminPage.qml"
                }
            }
        }
    }



//        void system_LogRowMsg                       (QString logMsgArray[2]);

//     property string arrayValue2
    Connections {
//                id:timeinputField
        target: appUi
//                onValueChanged: label1test.text = Kconst
onSystem_LogRowMsg:{
//    console.log("Item is fully loaded! ",logMsgArray[0],"  ",logMsgArray[1],"  ",logMsgArray[2],"  ",logMsgArray[3]);

    var newColumnLoader = columnComponent.createObject(loggsclm);//manualColumnContainer
//    newColumnLoader.arrayValue1=logMsgArray[0]
//    newColumnLoader.arrayValue2=logMsgArray[1]
    newColumnLoader.arrayValue1=logMsgArray[0]
    newColumnLoader.arrayValue2=logMsgArray[1]
    newColumnLoader.arrayValue3=logMsgArray[2]
    newColumnLoader.arrayValue4=logMsgArray[3]
}
    }



    // Loader-based approach to load a new column dynamically
    Component {
        id: columnLoaderComponent
        Loader {
            id:columnComponentloader
            sourceComponent: columnComponent
        }
    }

    // Reusable Column component

    Component {
        id: columnComponent

        Row{
            spacing:28
            id:loggsRow
            height: loggsChanges.contentHeight
            property string arrayValue1//: loggsChanges.text
               property string arrayValue2//:loggsDate.text
             property string arrayValue3
             property string arrayValue4
            Text {
                width: 120
                height: 38
                text: loggsRow.arrayValue1
                font.letterSpacing: 1
                font.pixelSize: 32
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                width: 250
                height: 38
                text: loggsRow.arrayValue2
                font.letterSpacing: 1
                font.pixelSize: 32
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id:loggsDate
                width: 200
                height: 38
                text:loggsRow.arrayValue3// "01/01/2024"
                font.letterSpacing: 1
                font.pixelSize: 32
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                width: 200
                height: 38
//                text: "01:00 PM"
                font.letterSpacing: 1
                font.pixelSize: 32
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id:loggsChanges
                width: 1450//353
                height: 90
                text:loggsRow.arrayValue4// "initial Hire fee :xxxx.xxxx UNIT |initial Time:xxxx.xxxx sec |Tariff Per Hour :xxxx.xxxx\nTariff Per Distance :xxxx.xxxx|initial Distance:xxxx.xxxx KM|Extra Charges:xxxx.xxxx UNIT"
                font.letterSpacing: 1
                font.pixelSize: 32
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                lineHeight: 1.2
                wrapMode: Text.WordWrap
                font.family: "Roboto"
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

