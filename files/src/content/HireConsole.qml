import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Item {
    id: hireConsoles
    width: Constants.width
    height: Constants.height
    state: "waithirestate"

    Connections {
        target: appUi
        onSystem_hireState: {
            if(hireStateVAlue===1){
                hireConsoles.state = "journyfinishedstate"//hiredstate
            }else if(hireStateVAlue===0){
                hireConsoles.state = "waithirestate"
            }else if(hireStateVAlue===2){
                hireConsoles.state = "hiredstate"
            }
        }
    }

    Rectangle {
        id: hireConsoleDisplay
        x: 52
        y: -34
        width: 200
        height: 234
        color: "#bf010219"
        border.color: "#010219"
        border.width: 0
        clip: true
        radius: 45  // Adjust this value for how rounded you want the bottom corners
        // Mask to keep top corners square
        Rectangle{
            id: rectangle
            x: -20
            y: 191
            width: 394
            height: 130
            visible: false
            color: "#4c0fe6ef"
            radius: 20
            border.width: 0
        }

        Column{
            id: separatorLine1
            x: 365
            y: 200
            visible: false
            spacing: 10
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
        }

        Column{
            id: separatorLine2
            x: 365+358
            y: 200
            visible: false
            spacing: 10
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
            ToolSeparator {
            }
        }






        Column{
            id:journydistancevaluedisplayRow
            x: 35
            y: 355
            Row{
                spacing: 12
                Image {
                    source: "images/Group 163.png"
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: journydistancelabel
                    width: 183
                    color: "#ffffff"
                    text: qsTr("DISTANCE")
                    font.letterSpacing: 0.3
                    font.pixelSize: 28
                    font.weight: Font.Medium
                    font.family: "Montserrat"
                }
            }
            Row{
                //            id:journydistancevaluedisplayRow
                //            x: 76
                //            y: 370
                //            spacing: 5
                Text {
                    width: 65
                    text: (" ")
                }
                Text {
                    id: journydistancevaluedisplay
                    width: 10 + contentWidth
                    height: 50
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                    font.letterSpacing: 0.2
                    font.pixelSize: 48
                    horizontalAlignment: Text.AlignRight
                    font.weight: Font.Medium
                    font.family: "Montserrat"
                    Connections {
                        target: appUi
                        onSystem_tripDistance: {
                            journydistancevaluedisplay.text = tripDistanceValue
                        }
                    }
                }

                Text {
                    id: journydistanceUnit
                    width: 52
                    height: 50
                    color: "#ffffff"
                    text: distanceUnit
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignBottom
                    anchors.bottomMargin: 0
                    font.weight: Font.Normal
                    font.family: "Montserrat"
                }
            }
        }


        Column{
            id: journydurationvaluedisplayRow
            x: 35
            y: 450
            //                target: journydurationIcon
            //                x: 409
            //                y: 224
            Row{
                spacing: 12
                Image {
                    source: "images/time-outline.png"
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id:journydurationLable
                    color: "#ffffff"
                    text: qsTr("DURATION")
                    font.pixelSize: 28
                    font.family: "Montserrat"
                }
            }

            Row{
                Text {
                    width: 65
                    text: qsTr("  ")
                }
                Text {
                    id: journydurationvaluedisplay
                    width:  10 + contentWidth
                    height: 50
                    color: "#ffffff"
                    text: ""
                    font.letterSpacing: 0.5
                    font.pixelSize: 48
                    horizontalAlignment: Text.AlignLeft
                    font.family: "Montserrat"
                    Connections {
                        target: appUi
                        onSystem_tripTime: {
                            journydurationvaluedisplay.text = tripTimeValue
                        }
                    }
                }
                Text {
                    id: journydurationunit
                    height: 50
                    color: "#ffffff"
                    text: "hr"
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignBottom
                    anchors.bottomMargin: 0
                    font.family: "Montserrat"
                }
            }
        }

        Column{
            id: starttimeFrame
            x: 409
            y: 332
            visible: false
            Row{
                spacing: 12
                Image {
                    source: "images/time-outline(1).png"
                }
                Text {
                    color: "#ffffff"
                    text: "START TIME"
                    font.pixelSize: 20
                    font.family: "Montserrat"
                }
            }

            Row{
                spacing: 4
                x:36
                Text {
                    id: starttimedisplayId
                    color: "#ffffff"
                    width: 133
                    height: 40
                    font.pixelSize: 20
                    font.family: "Montserrat"
                }
                Text {
                    id: text2
                    color: "#c0ffffff"
                    text: "PM"
                    font.pixelSize: 16
                    font.family: "Montserrat"
                }
            }
        }


        Column {
            id: endtimeFrame
            x: 409
            y: 410
            visible: false
            Row {
                Image {
                    source: "images/time-outline(2).png"
                }

                Text {
                    color: "#ffffff"
                    text: "END TIME"
                    font.pixelSize: 20
                    font.family: "Montserrat"
                }
                spacing: 12
            }

            Row {
                x: 36
                Text {
                    id: endtimedisplayId
                    width: 133
                    height: 40
                    color: "#ffffff"
                    font.pixelSize: 20
                    font.family: "Montserrat"
                }

                Text {
                    id: text3
                    color: "#c0ffffff"
                    text: "PM"
                    font.pixelSize: 16
                    font.family: "Montserrat"
                }
                spacing: 4
            }
        }

        Row{
            id: row
            visible: false
            spacing: 10
            Image {
                source: "images/document.png"
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: "#ffffff"
                text: "Total"
                font.pixelSize: 24
                verticalAlignment: Text.AlignVCenter
                font.family: "Encode Sans"
            }
        }

        Row{
            id: totalfareRow
            spacing: 10
            x: 29
            y: 170

            Text {
                id: totalfare
                width: 10 + contentWidth
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.letterSpacing: 1.3
                font.pixelSize: 62
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignTop
                font.bold: true
                font.family: "Encode Sans"
                Connections {
                    target: appUi
                    onSystem_fareCounter: {
                        totalfare.text = fareCounterValue
                    }
                }
            }
            Text {
                id: farecurrency
                width: 72
                color: "#ffffff"
                text: currencyUnit
                anchors.bottom: parent.bottom
                font.pixelSize: 32
                verticalAlignment: Text.AlignBottom
                anchors.bottomMargin: 5
                font.family: "Montserrat"
            }
        }
    }

    Rectangle {
        id: hireindicationBackground
        x: 52
        y: 38
        width: 205
        height: 62
        color: "#010219"
        radius: 4
        Text {
            id: hirestateeTextIndication
            x: 0
            y: 0
            width: 205
            height: 62
            color: "#ffffff"
            text: qsTr("FOR HIRE")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            antialiasing: true
            enabled: true
            font.family: "Encode Sans"
            layer.mipmap: false
            font.preferShaping: true
            font.pointSize: 28
            layer.smooth: false
            font.kerning: true
            smooth: true
            font.weight: Font.DemiBold
        }
    }

    Rectangle {
        id: hireButton
        x: 52
        y: 612
        width: 500
        height: 110
        radius: 55
        border.color: "#ca0615"
        border.width: 0
        clip: true
        Rectangle {
            id: hireButtonbottom
            width: parent.width
            height: parent.height / 2
            color: parent.color
            radius: 0
            border.width: 0
            anchors.bottom: parent.bottom
            clip: true
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop {
                    id:hireButtonGrad1a
                    position: 0
                    color: "#a40511"
                }
                GradientStop {
                    id:hireButtonGrad1b
                    position: 1
                    color: "#ca0615"
                }
            }
        }

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                id:hireButtonGrad2a
                position: 0
                color: "#a40511"
            }
            GradientStop {
                position: 1
                id:hireButtonGrad2b
                color: "#ca0615"
            }
        }

        Text {
            id: hirestateControlButtuntext
            x: 148
            y: 29
            color: "#ffffff"
            text: qsTr("TRIP")
            font.pixelSize: 41
            lineHeightMode: Text.ProportionalHeight
            clip: true
            layer.smooth: false
            layer.textureSize.height: 0
            layer.textureSize.width: 0
            layer.format: ShaderEffectSource.Alpha
            font.preferShaping: true
            font.kerning: false
            styleColor: "#ffffff"
            fontSizeMode: Text.FixedSize
            style: Text.Normal
            renderType: Text.QtRendering
            textFormat: Text.PlainText
            font.styleName: "Medium"
            font.family: "Encode Sans"
            font.weight: Font.DemiBold
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: hireButtonmouseArea
            hoverEnabled: true
            anchors.fill: parent // Makes MouseArea fill the entire rectangle
            property string uiHireStatestr // remove
            onClicked: {
                console.log("Clicked on hirewaitestateindication")
                if(hirestateControlButtuntext.text==="TRIP"){
                    hireConsoles.state  = "hiredstate"
                    uiHireStatestr = "HIRED"
                    appUi.uiHireState(uiHireStatestr)
                    starttimedisplayId.text =  Qt.formatDateTime(timeValue,"hh:mm:ss")
                    navigationFlag=false
                }else if(hirestateControlButtuntext.text==="STOP"){
                    hireConsoles.state  = "journyfinishedstate"
                    uiHireStatestr = "STOPED"
                    appUi.uiHireState(uiHireStatestr)
                    endtimedisplayId.text =  Qt.formatDateTime(timeValue,"hh:mm:ss")
                    timer.start()
                    progressBar.progressValue =0
                    progressBar.width=progressBar.parent.width*0.8
                    progressBarBackGround.visible=true
                    progressBar.visible=true
                    hireButtonmouseArea.enabled=false//hireButtonmouseArea
                }else if(hirestateControlButtuntext.text==="DONE"){
                    hireConsoles.state  = "waithirestate"
                    uiHireStatestr = "DONE"
                    appUi.uiHireState(uiHireStatestr)
                    navigationFlag = true
                }
                //                appUi.uiSetNewKconstant(uiHireStatestr)
            }

            onPressed: {

                hireButton.x=53
                hireButton.width = 498
                hireButton.height=108
            }
            onReleased: {
                hireButton.x=52
                hireButton.width = 500
                hireButton.height=110
            }
        }

        Rectangle{
            id:progressBarBackGround
            color: "#6b949e9e"
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            width: parent.width * 0.8
            height: 10
            radius: 55
            visible: false
        }

        Rectangle {
            id: progressBar
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            width: parent.width * 0.8
            height: 10
            visible: false
            property int progressValue // :parent.width * 0.8
            radius: 55
            color: "#43dff7"  // Progress color
            //            Behavior on width { NumberAnimation { duration: 1000 } }
            //            background: Rectangle {
            //                color: "#333333"
            //                radius: 5
            //            }

            Timer {
                id: timer
                interval: 10
                running: true
                repeat: true
                onTriggered: {
                    //                    if (progressBar.value >= 1.0) {
                    ////                        timer.running = false;  // Stop when fully loaded
                    //                    } else {
                    //                        progressBar.progress =progressBar.progress+10  // Increase progress
                    //                    }
                    if(parent.width>1){
                        progressBar.progressValue=progressBar.progressValue+1
                        parent.width=parent.parent.width*0.8-progressBar.progressValue
                    }else{
                        progressBarBackGround.visible=false
                        progressBar.visible=false
                        hireButtonmouseArea.enabled=true//hireButtonmouseArea
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "waithirestate"

            PropertyChanges {
                target: hireConsoleDisplay
                x: 52
                y: 38
                width: 221
                height: 62
                visible: false
                enabled: false
            }

            PropertyChanges {
                target: hireindicationBackground
                x: 52
                y: 38
                opacity: 0.749
            }

            PropertyChanges {
                target: hirestateControlButtuntext
                text: qsTr("TRIP")
            }

            PropertyChanges {
                target: hireButtonGrad1a
                color : "#0c943c"
            }

            PropertyChanges {
                target: hireButtonGrad1b
                color : "#07b400"
            }

            PropertyChanges {
                target: hireButtonGrad2a
                color : "#0c943c"
            }

            PropertyChanges {
                target: hireButtonGrad2b
                color : "#07b400"
            }

            PropertyChanges {
                target: hireButtonbottom
                color: parent.color
            }

            PropertyChanges {
                target: hireButton
                x: 52
            }

            PropertyChanges {
                target: totalfareRow
                visible: false
            }

            PropertyChanges {
                target: journydistancevaluedisplayRow
                visible: false
            }



            PropertyChanges {
                target: journydurationvaluedisplayRow
                visible: false
            }

            //            PropertyChanges {
            //                target: journydistancelabel
            //                visible: false
            //            }



        },
        State {
            name: "hiredstate"

            PropertyChanges {
                target: hireConsoleDisplay
                x: 52
                y: -34
                width: 500
                height: 632
                visible: true
                radius: 42
            }

            PropertyChanges {
                target: hireindicationBackground
                x: 72
                y: 38
                width: 162
                visible: true
                color: "#07bf00"
            }

            PropertyChanges {
                target: hirestateeTextIndication
                x: 8
                y: 0
                width: 146
                height: 62
                visible: true
                text: qsTr("HIRED")
                font.weight: Font.Normal
                font.family: "Encode Sans"
            }

            PropertyChanges {
                target: hireButton
                x: 52
                y: 612
            }

            PropertyChanges {
                target: hirestateControlButtuntext
                text: qsTr("STOP")
            }
            PropertyChanges {
                target: hireButtonGrad1a
                color : "#a40511"
            }
            PropertyChanges {
                target: hireButtonGrad1b
                color : "#ca0615"
            }
            PropertyChanges {
                target: hireButtonGrad2a
                color : "#a40511"
            }
            PropertyChanges {
                target: hireButtonGrad2b
                color : "#ca0615"
            }

            PropertyChanges {
                target: totalfareRow
                x: 29
                y: 170
            }

            PropertyChanges {
                target: journydurationvaluedisplayRow
                x: 35
                y: 450
            }


            PropertyChanges {
                target: journydurationvaluedisplay
                font.pixelSize: 48
            }

            PropertyChanges {
                target: journydurationLable
                font.pixelSize: 28
            }

            PropertyChanges {
                target: journydistancelabel
                font.pixelSize: 28
            }
            PropertyChanges {
                target: journydistancevaluedisplay
                font.pixelSize: 48
            }



        },
        State {
            name: "journyfinishedstate"

            PropertyChanges {
                target: hireConsoleDisplay
                x: 52
                y: -36
                width: 748
                height: 605
                color: "#bf010219"
            }

            PropertyChanges {
                target: hireindicationBackground
                x: 72
                y: 38
                width: 205
                color: "#cb0615"
            }

            PropertyChanges {
                target: hirestateeTextIndication
                x: 0
                y: 0
                text: qsTr("STOPPED")
                font.pixelSize: 28
                font.styleName: "Medium"
                font.bold: false
                font.weight: Font.Medium
                font.family: "Encode Sans"
            }

            PropertyChanges {
                target: hirestateControlButtuntext
                x: 138
                y: 29
                text: qsTr("DONE")
            }

            PropertyChanges {
                target: hireButtonGrad1a
                color : "#050e1d"
            }
            PropertyChanges {
                target: hireButtonGrad1b
                color : "#000000"
            }
            PropertyChanges {
                target: hireButtonGrad2a
                color : "#050e1d"
            }
            PropertyChanges {
                target: hireButtonGrad2b
                color : "#000000"
            }

            PropertyChanges {
                target: totalfareRow
                x: 22
                y: 246
                visible: true
            }

            PropertyChanges {
                target: journydistancelabel
                font.pixelSize: 20
            }
            PropertyChanges {
                target: journydistancevaluedisplay
                font.pixelSize: 32
            }

            PropertyChanges {
                target: journydistanceUnit
                font.pixelSize: 16
            }

            PropertyChanges {
                target: journydurationunit
                font.pixelSize: 16
            }



            PropertyChanges {
                target: journydurationvaluedisplayRow
                x: 409
                y: 246
                visible: true
            }

            PropertyChanges {
                target: journydurationvaluedisplay
                font.pixelSize: 32
            }

            PropertyChanges {
                target: journydurationLable
                font.pixelSize: 20
            }

            PropertyChanges {
                target: journydistancelabel
                font.pixelSize: 20
            }

            PropertyChanges {
                target: farecurrency
                font.pixelSize: 20
            }


            PropertyChanges {
                target: journydistancevaluedisplayRow
                visible: true
            }

            PropertyChanges {
                target: starttimeFrame
                visible: true
            }

            PropertyChanges {
                target: endtimeFrame
                visible: true
            }

            PropertyChanges {
                target: rectangle
                visible: true

            }

            PropertyChanges {
                target: row
                x: 24
                y: 198
                visible: true
            }

            PropertyChanges {
                target: separatorLine1
                visible: true
            }

            PropertyChanges {
                target: separatorLine2
                visible: true
            }

            PropertyChanges {
                target: text2
                color: "#ffffff"
            }
            PropertyChanges {
                target: text3
                color: "#ffffff"
            }
        }
    ]

    //    transitions: [
    //            Transition {
    //                from: "default"
    //                to: "clicked"
    //                reversible: true
    //                // Add a color animation
    //                ColorAnimation {
    //                    target: rectangle3
    //                    property: "opacity"
    //                    duration: 2000
    //                }
    //                // Add a scale animation
    ////                ScaleAnimation {
    ////                    target: rectangle4
    ////                    property: "scale"
    ////                    duration: 500
    ////                    easing.type: Easing.OutBounce
    ////                }
    ////                // Add an opacity animation
    ////                OpacityAnimation {
    ////                    target: rectangle4
    ////                    property: "opacity"
    ////                    duration: 500
    ////                }
    //            }
    //        ]

}
