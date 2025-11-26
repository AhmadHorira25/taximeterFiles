import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Item {
    id:mainconsolId
    width: Constants.width
    height: Constants.height

//    Loader{
//        id:mainWindowLoader
//    }



//    property string currencyUnit :"AED" //: value
//    Connections {
//        target: appUi
//        onSystem_currencyUnit: {
//            currencyUnit = currencyUnitvalue
//        }
//    }

//    Rectangle{
//        x:0
//        y:0
//        width: Constants.width
//        height: Constants.height
//        gradient: Gradient {
//            orientation: Gradient.Horizontal
//            GradientStop {
//                position: 0
//                color: "#000426"
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



    //    Image {
    //        x: -35
    //        y: 0
    //        width: 2595
    //        height: 720
    //        source: "images/map bg.png"
    //    }
    Rectangle{
        width: 2595
        height: 720
        visible: true
        color: "#000000"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#29323c"
            }

            GradientStop {
                position: 1
                color: "#485563"
            }
            orientation: Gradient.Vertical
        }

}







    Image {
        id: ellipse2
        x: 1491
        y: 0
        source: "images/Ellipse 2.png"
        fillMode: Image.PreserveAspectFit
    }

//    HeadBar {
//        id: headBar
//        x: 0
//        y: 0
//}
        HireConsole {
            id: hireConsole
            x: 0
            y: 0
        }


    TabsConsole {
        id: tabsConsole
        x: 964
        y: 612
    }

//    TotalizerPage{
//        id :totalizerPageid
//        x:351
//        y:148
//        property bool visibleCondition2: navigationFlag
//        onVisibleCondition2Changed: {
//            if(visibleCondition2===false){
//                visible = false
////                visible = true
//            }
////            else{
////                visible = false
////            }
//        }





//        onVisibleChanged: {
//            if(visible===true){
//                totalizerTimerId.start()
//                totalizerTimerId.tickCounter=0
//            }else{
//                totalizerTimerId.stop()
//            }
//        }

//        Timer {
//            id: totalizerTimerId
//            property int secretpushCounter: 0
//            property int tickCounter: 0
//            property int holdTimer: 0
//            property bool holdTimerflag: false
//            interval: 10 // in milliseconds (1 second)
//            repeat: true   // true = repeats, false = triggers once
//            running: true  // true = starts automatically
//            onTriggered: {
//                totalizerTimerId.tickCounter=totalizerTimerId.tickCounter+1
//                if(totalizerTimerId.tickCounter>1000){
//                    totalizerPageid.visible=false
//                    totalizerTimerId.tickCounter=0
//                }else{
//                    totalizerPageid.loaderIconTimeoutValue = (1000-totalizerTimerId.tickCounter)/10
//                }
//            }
//        }





//        visible: false
//    }







//    AboutPage{
//        id:aboutPageid
//    }

//    property bool warningwindowMsg: false

    Rectangle{
        id:warningwindow
        x: 876
        y: 405
        z:20
        width: 808
        height: 156
        visible: false//warningwindowVisiple //false
        color: "#c1010219"
        radius: 20
        border.width: 0



        onVisibleChanged: {
            if(visible===true){
                warningwindowTimerId.start()
                warningwindowTimerId.tickCounter=0
            }else{
                warningwindowTimerId.stop()
            }
        }
        LoodingIcon{
            id:warningLoaderIconTimeoutValue
            width: 40
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10

        }

        Timer {
            id: warningwindowTimerId
            property int secretpushCounter: 0
            property int tickCounter: 0
            property int holdTimer: 0
            property bool holdTimerflag: false
            interval: 10 // in milliseconds (1 second)
            repeat: true   // true = repeats, false = triggers once
            running: true  // true = starts automatically
            onTriggered: {
                warningwindowTimerId.tickCounter=warningwindowTimerId.tickCounter+1
                if(warningwindowTimerId.tickCounter>1000){
                    warningwindow.visible=false
                    warningwindowTimerId.tickCounter=0
                }else{
                    warningLoaderIconTimeoutValue.currentValue = (1000-warningwindowTimerId.tickCounter)/10
                }
            }
        }



        property bool warningVisibleCondition: navigationFlag
        onWarningVisibleConditionChanged:{
            if(warningVisibleCondition===false){
                visible = false
//                visible = true
            }
//            else{
//                visible = false
//            }
        }

        Column{
            width: 704
            height: 115
            x:32
            y:20
         spacing: 15
        Row{
            spacing: 4

            Image {
                source: "images/Group 266 1.png"
            }
            Text {
                color: "#ffffff"
//                        width:
                text: "Warning"
                font.pixelSize: 32
                font.family: "Encode Sans"
            }
        }
        Row{
            id: warningBox
            property string secandsLeft_off
        Text {
            color: "#bfffffff"
            text: warningwindowMsg// "ignition off , left "
            font.pixelSize: 20
            font.family: "Encode Sans"
        }
        }
    }
    }











//    Rectangle {
//        width: 500
//        height: 500
//        color: Constants.backgroundColor
//        TextInput {
//            id: textInput1test
//            x: 0
//            y: 0
//            width: 80
//            height: 22
//            color: "#d0b3ad"
//            text: qsTr("Text Input")
//            font.pixelSize: 12
//            selectionColor: "#ee0000"
//            transformOrigin: Item.Center
//        }

//        Label {
//            id: label1test
//            x: 100
//            y: 100
//            width: 245
//            height: 54
//            text: qsTr("Label")
//            Connections {
//                target: appUi
//                onValueChanged: label1test.text = s
//            }
//        }
//        Label {
//            id: label1test2
//            x: 200
//            y: 200
//            width: 245
//            height: 54
//            text: qsTr("Label")
//            Connections {
//                target: appUi
////                onValueChanged: label1test.text = Kconst
//                onSystemKconstant:label1test2.text = Kconst
//            }
//        }

//        Button {
//            id: button
//            text: qsTr("Press me")
//            anchors.verticalCenter: parent.verticalCenter
//            flat: true
//            highlighted: true
//            checkable: true
//            anchors.horizontalCenter: parent.horizontalCenter
//            Connections {
//                target: button
//                onClicked: appUi.changeValue(textInput1test.text)
//            }
//        }

//    }

    Rectangle {
        y: 16
        width: 370
        height: 120
        color: "#00ffffff"
        radius: 12
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "#0fe6ef"
        border.width: 0
        visible: navigationFlag
//        Image {
//            x: 23
//            y: 18
//            source: "images/Group 205.png"
//            fillMode: Image.PreserveAspectFit
        //        }
//        Text {
//            color: "#ffffff"
//            anchors.centerIn: parent
//            text: qsTr("IOTISTIC")
//            font.letterSpacing: 7
//            verticalAlignment: Text.AlignVCenter
//            lineHeight: 1.1
//            font.family: "Encode Sans"
//            font.underline: true
//            font.pointSize: 60

//        }


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
