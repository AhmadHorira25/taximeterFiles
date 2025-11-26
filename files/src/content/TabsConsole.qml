import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
//import "Settingpage"
//import QtQuick.Timeline 1.0




Item {
//    id: tabscoslewndw
//    width: Constants.width
//    height: Constants.height
    activeFocusOnTab: true
    width: 632
    height: 108+33

//    enabled: navigationFlag
//    visible: navigationFlag

//    Loader {
//        id: tabscoslewndwPageLoader
//        anchors.fill: parent
//    }

//    Image {
//        id: component52
//        x: 964
//        y: 612
//        opacity: 0.272
//        source: "images/Component 5(2).png"
//        fillMode: Image.PreserveAspectFit
//    }

    Rectangle {
        id: tabsButtons

        width: 632
        height: 108 //+33
        color: "#00010219"
//        color: "#9a010219"

        radius: 41
        border.width: 0
        clip: true

        Rectangle {
            id: clipArea
            width: 632
            height: 108+33
            color: "#9a010219"
            radius: 41
            border.width: 0
            clip: true

            // any extra area of parent will be cliped
        }

        Row{
            width: 500
            height: 108
            spacing: 180
            // 91
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: navigationFlag
//            visible: navigationFlag

            Image {
//                x:40//20
                id: group2221
                source: "images/Group 222.png"
                anchors.verticalCenter: parent.verticalCenter

                Rectangle {
                    width: 64
                    height: 108
                    radius: 20
                    border.width: 0
                    anchors.top: parent.top
                    anchors.topMargin: -14
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.color: "#c8010219"
                    clip: true
                    z:-1
                    gradient: Gradient {
                        orientation: Gradient.Vertical
                        GradientStop {
                            id:infobuttonstyle1
                            position: 0
                            color: "#000000ff"
                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                }
                            }
                        }
                        GradientStop {
                            id:infobuttonstyle2
                            position: 1
                            color: "#000000ff"
                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                }
                            }
                        }
                    }


                    MouseArea{
                        z:1
                        anchors.fill: parent
                        enabled: true
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: {
                            pageLoader.source = "AboutPage.qml"
                        }
                        onEntered: {
                            infobuttonstyle1.color="#1affffff"
                            infobuttonstyle2.color= "#1a1E4690"
                        }
                        onExited:{
                            infobuttonstyle1.color="#000000ff"
                            infobuttonstyle2.color= "#000000ff"
                        }
                        onPressed: {
                            parent.border.width=2
                        }
                    }
                }
            }



            Image {
//                id: settingTabbutton
                source: "images/Frame 218.png"
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    x: 24
                    y: -58
                    visible: newwarningMsgIndication
                    color: "#ff0000"
                    text: "."
                    font.pixelSize: 100
                }


                Rectangle {
                    width: 64
                    height: 108
                    radius: 20
                    border.width: 0
                    anchors.top: parent.top
                    anchors.topMargin: -14
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.color: "#c8010219"
                    clip: true
                    z:-1
                    gradient: Gradient {
                        orientation: Gradient.Vertical
                        GradientStop {
                            id:notificationbuttonstyle1
                            position: 0
                            color: "#000000ff"
                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                }
                            }
                        }
                        GradientStop {
                            id:notificationbuttonstyle2
                            position: 1
                            color: "#000000ff"
                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                }
                            }
                        }
                    }

                    property bool warningWindowVisipleBuffer : warningwindow.visible
                    onWarningWindowVisipleBufferChanged: {
                        if(warningwindow.visible===false){
                            notificationbuttonstyle1.color="#000000ff"
                            notificationbuttonstyle2.color= "#000000ff"
                        }
                    }


                    MouseArea{
                        z:1
                        anchors.fill: parent
                        enabled: true
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
//                        property type name: value



                        onClicked: {
                            newwarningMsgIndication = false
                            if (warningwindow.visible===true){
                                warningwindow.visible=false
                                notificationbuttonstyle1.color="#000000ff"
                                notificationbuttonstyle2.color= "#000000ff"
                            }else{
                                warningwindow.visible=true
                                notificationbuttonstyle1.color="#1affffff"
                                notificationbuttonstyle2.color= "#1a1E4690"
                            }
                        }
                        onEntered: {
                            if (warningwindow.visible===false){
    //                        buttonFrame1.color="#94000000"
    //                        buttonFrame2.color= "#95324798"
                                notificationbuttonstyle1.color="#1affffff"
                                notificationbuttonstyle2.color= "#1a1E4690"
                            }
                        }
                        onExited:{
                            if (warningwindow.visible===false){
                            notificationbuttonstyle1.color="#000000ff"
                            notificationbuttonstyle2.color= "#000000ff"
                            }
                        }
                        onPressed: {
                            parent.border.width=2
                        }
                        onReleased:{
                            parent.border.width=0
                        }


                    }
                }
            }


            Image {
                id: image
                source: "images/Frame 219.png"
                anchors.verticalCenter: parent.verticalCenter
//            }
            Rectangle {
                width: 64
                height: 108
                radius: 20
                border.width: 0
                anchors.top: parent.top
                anchors.topMargin: -14
                anchors.horizontalCenter: parent.horizontalCenter
                border.color: "#c8010219"
                clip: true
                z:-1
                gradient: Gradient {
                    orientation: Gradient.Vertical
                    GradientStop {
                        id:buttonFrame1
                        position: 0
                        color: "#000000ff"
                        Behavior on color {
                            ColorAnimation {
                                duration: 500
                            }
                        }
                    }
                    GradientStop {
                        id:buttonFrame2
                        position: 1
                        color: "#000000ff"
                        Behavior on color {
                            ColorAnimation {
                                duration: 500
                            }
                        }
                    }
                }


                property bool totalizerButtonVisibleFlage : totalizerPageid.visible
                onTotalizerButtonVisibleFlageChanged: {
                    if(totalizerPageid.visible===false){
                    buttonFrame1.color="#000000ff"
                    buttonFrame2.color= "#000000ff"
//                        parent.border.width=0
                    }
                }

                MouseArea{
                    z:1
                    anchors.fill: parent
                    enabled: true
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
//                        "Mainconsol.qml"



                        pageLoader.source = "AdminPageTotalizer.qml"



//                        if (totalizerPageid.visible===true){
//                            totalizerPageid.visible=false
//                            buttonFrame1.color="#000000ff"
//                            buttonFrame2.color= "#000000ff"
//                        }else{
//                            totalizerPageid.visible=true
//                            buttonFrame1.color="#1affffff"
//                            buttonFrame2.color= "#1a1E4690"
//                        }
                    }
//                    onEntered: {
//                        if (totalizerPageid.visible===false){
////                        buttonFrame1.color="#94000000"
////                        buttonFrame2.color= "#95324798"
//                            buttonFrame1.color="#1affffff"
//                            buttonFrame2.color= "#1a1E4690"
//                        }
//                    }
//                    onExited:{
//                        if (totalizerPageid.visible===false){
//                        buttonFrame1.color="#000000ff"
//                        buttonFrame2.color= "#000000ff"
//                        }
//                    }

                    onPressed: {
                        parent.border.width=2
                    }
                    onReleased:{
                        parent.border.width=0
                    }
                }
            }
        }








        }


    }







//    Rectangle{
//        x: 1248
//        y: 628
//        width: 64
//        height: 77
//        color: "#000000ff"
//        z:1

//    }









//    Timeline {
//        id: timeline
//        animations: [
//            TimelineAnimation {
//                id: timelineAnimation
//                duration: 1000
//                loops: 1
//                running: true
//                to: 1000
//                from: 0
//            }
//        ]
//        startFrame: 0
//        endFrame: 1000
//        enabled: true
//    }


//    }



//    Rectangle {
//        width: 64
//        height: 108
//        radius: 20
//        border.width: 0
//        border.color: "#c8010219"
//        clip: true
//        gradient: Gradient {
//            orientation: Gradient.Vertical
//            GradientStop {
//                id:buttonFrame1
//                position: 0
//                Behavior on color {
//                    ColorAnimation {
//                        duration: 500
//                    }
//                }
//            }
//            GradientStop {
//                id:buttonFrame2
//                position: 1
//                color: "#000000ff"
//                Behavior on color {
//                    ColorAnimation {
//                        duration: 500
//                    }
//                }
//            }
//        }

//        Image {
//            source: "images/Frame 219.png"
//        }
//        MouseArea{
//            z:1
//            anchors.fill: parent
//            enabled: true
//            cursorShape: Qt.PointingHandCursor
//            hoverEnabled: true
//            onClicked: {
//                if (totalizerPageid.visible===true){
//                    totalizerPageid.visible=false
//                    buttonFrame1.color="#000000ff"
//                    buttonFrame2.color= "#000000ff"
//                }else{
//                    totalizerPageid.visible=true
//                    buttonFrame1.color="#e4000000"
//                    buttonFrame2.color= "#e5324798"
//                }
//            }
//            onEntered: {
//                if (totalizerPageid.visible===false){
//                buttonFrame1.color="#94000000"
//                buttonFrame2.color= "#95324798"
//                }
//            }
//            onExited:{
//                if (totalizerPageid.visible===false){
//                buttonFrame1.color="#000000ff"
//                buttonFrame2.color= "#000000ff"
//                }
//            }

//            onPressed: {
//                parent.border.width=2
//            }
//            onReleased:{
//                parent.border.width=0
//            }
//        }
//    }





//========================================================




//ScrollView{
//    width: 500
//    height: 500
//    Rectangle {
//        id: testitem
//        width: 200
//        height: 200
//        color: "#3498db"
////        opacity: 0
//        anchors.horizontalCenter: parent.horizontalCenter
//        y: 100//parent.height // Start below the visible area

//        states: [
//            State {
//                name: "visible"
//                PropertyChanges {
//                    target: testitem
////                    opacity: 1
//                    y: parent.height / 2 - testitem.height / 2 // Center vertically
//                }
//            },
//            State {
//                name: "hidden"
//                PropertyChanges {
//                    target: testitem
////                    opacity: 0
//                    y: -testitem.height // Move above the visible area when hidden
//                }
//            }
//        ]

//        transitions: [
//            Transition {
////                from: "hidden"
////                to: "visible"
//                SequentialAnimation {
//                    PropertyAnimation {
//                        target: testitem
//                        property: "y"
//                        from: parent.height
//                        to: parent.height / 2 - testitem.height / 2
//                        duration: 700
//                        easing.type: Easing.OutQuad
//                    }
////                    PropertyAnimation {
////                        target: testitem
////                        property: "opacity"
////                        from: 0
////                        to: 1
////                        duration: 1500
////                    }
//                }
//            },
//            Transition {
////                from: "visible"
////                to: "hidden"
//                SequentialAnimation {
////                    PropertyAnimation {
////                        target: testitem
////                        property: "opacity"
////                        from: 1
////                        to: 0
////                        duration: 1500
////                    }
//                    PropertyAnimation {
//                        target: item
//                        property: "y"
//                        from: parent.height / 2 - testitem.height / 2
//                        to: -testitem.height
//                        duration: 1500
//                        easing.type: Easing.InQuad
//                    }
//                }
//            }
//        ]

//        MouseArea {
//            anchors.fill: parent
//            onClicked: testitem.state = testitem.state === "visible" ? "hidden" : "visible"
//        }
//    }
//}
//========================================================




}
