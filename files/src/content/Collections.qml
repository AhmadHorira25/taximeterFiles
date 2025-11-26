import QtQuick 2.15
import QtQuick.Controls 2.0
import UntitledProject3 1.0

Item {
    width: Constants.width
    height: Constants.height

    Rectangle {
        id: jurnyDoneindication1
        x: 0
        y: 0
        width: 400
        height: 110
        color: "#050e1d"
        radius: 55
        border.color: "#000000"
        border.width: 2
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#050e1d"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
            orientation: Gradient.Horizontal
        }
        clip: true
        Rectangle {
            width: parent.width
            height: parent.height / 2
            color: parent.color
            radius: 0
            border.width: 0
            anchors.bottom: parent.bottom
        }

        Text {
            x: 143
            y: 29
            color: "#ffffff"
            text: qsTr("DONE")
            font.pixelSize: 41
            lineHeightMode: Text.ProportionalHeight
            textFormat: Text.PlainText
            font.family: "Encode Sans"
            fontSizeMode: Text.FixedSize
            font.kerning: false
            font.preferShaping: true
            font.styleName: "Medium"
            style: Text.Normal
            font.weight: Font.DemiBold
            layer.textureSize.width: 0
            layer.smooth: false
            layer.textureSize.height: 0
            renderType: Text.QtRendering
            styleColor: "#ffffff"
            layer.format: ShaderEffectSource.Alpha
        }
    }

    Rectangle {
        id: roundedRectangle
        x: 608
        y: 438
        width: 400
        height: 200
        radius: 55
        border.color: "#07b103"
        border.width: 2
        clip: true
        Rectangle {
            color: "#4caf50"
            radius: 20
            anchors.fill: parent
            anchors.rightMargin: -614
            anchors.topMargin: 143
            anchors.bottomMargin: -143
            anchors.leftMargin: 614
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.42009
                color: "#0a9b2c"
            }

            GradientStop {
                position: 0.75114
                color: "#07b103"
            }

            GradientStop {
                position: 1
                color: "#07b103"
            }
        }
    }

    Rectangle {
        id: roundedRectangle1
        x: 61
        y: 438
        width: 400
        height: 200
        radius: 55
        border.color: "#ca0615"
        border.width: 0
        clip: true
        Rectangle {
            color: "#a40511"
            radius: 20
            anchors.fill: parent
            anchors.rightMargin: -614
            anchors.topMargin: 143
            anchors.bottomMargin: -143
            anchors.leftMargin: 614
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.42009
                color: "#a40511"
            }

            GradientStop {
                position: 0.75114
                color: "#ca0615"
            }

            GradientStop {
                position: 1
                color: "#ca0615"
            }
        }
    }

    Rectangle {
        id: roundedRectangle2
        x: 509
        y: 47
        width: 400
        height: 200
        radius: 55
        border.color: "#000000"
        border.width: 0
        clip: true
        Rectangle {
            color: "#050e1d"
            radius: 20
            anchors.fill: parent
            anchors.rightMargin: -614
            anchors.topMargin: 143
            anchors.bottomMargin: -143
            anchors.leftMargin: 614
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.42009
                color: "#050e1d"
            }

            GradientStop {
                position: 0.75114
                color: "#000000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
    }

    Rectangle {
        id: jurnyRunnigindication
        x: 1772
        y: 244
        width: 400
        height: 110
        radius: 55
        border.color: "#ca0615"
        border.width: 0
        clip: true
        Rectangle {
            width: parent.width
            height: parent.height / 2
            color: parent.color
            radius: 0
            border.width: 0
            anchors.bottom: parent.bottom
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop {
                    position: 0
                    color: "#a40511"
                }

                GradientStop {
                    position: 1
                    color: "#ca0615"
                }
            }
        }

        Text {
            x: 148
            y: 29
            color: "#ffffff"
            text: qsTr("STOP")
            font.pixelSize: 41
            lineHeightMode: Text.ProportionalHeight
            font.styleName: "Medium"
            textFormat: Text.PlainText
            renderType: Text.QtRendering
            font.family: "Encode Sans"
            layer.textureSize.height: 0
            layer.format: ShaderEffectSource.Alpha
            font.preferShaping: true
            layer.smooth: false
            styleColor: "#ffffff"
            fontSizeMode: Text.FixedSize
            layer.textureSize.width: 0
            font.kerning: false
            font.weight: Font.DemiBold
            style: Text.Normal
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#a40511"
            }

            GradientStop {
                position: 1
                color: "#ca0615"
            }
        }
    }

    Rectangle {
        id: hirewaitestateindication
        x: 1772
        y: 401
        width: 400
        height: 110
        radius: 55
        border.color: "#07b400"
        border.width: 0
        clip: true
        Rectangle {
            width: parent.width
            height: parent.height / 2
            color: parent.color
            radius: 0
            border.width: 0
            anchors.bottom: parent.bottom
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop {
                    position: 0
                    color: "#0c943c"
                }

                GradientStop {
                    position: 1
                    color: "#07b400"
                }
            }
        }

        Text {
            x: 156
            y: 29
            color: "#ffffff"
            text: qsTr("TRIP")
            font.pixelSize: 41
            lineHeightMode: Text.ProportionalHeight
            font.styleName: "Medium"
            textFormat: Text.PlainText
            font.family: "Encode Sans"
            renderType: Text.QtRendering
            layer.textureSize.height: 0
            layer.format: ShaderEffectSource.Alpha
            font.preferShaping: true
            layer.smooth: false
            fontSizeMode: Text.FixedSize
            styleColor: "#ffffff"
            layer.textureSize.width: 0
            font.kerning: false
            font.weight: Font.DemiBold
            style: Text.Normal
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#0c943c"
            }

            GradientStop {
                position: 1
                color: "#07b400"
            }
        }
    }

    Rectangle {
        id: jurnyDoneindication
        x: 1772
        y: 104
        width: 400
        height: 110
        color: "#050e1d"
        radius: 55
        border.color: "#000000"
        border.width: 2
        clip: true
        Rectangle {
            width: parent.width
            height: parent.height / 2
            color: parent.color
            radius: 0
            border.width: 0
            anchors.bottom: parent.bottom
        }

        Text {
            x: 143
            y: 29
            color: "#ffffff"
            text: qsTr("DONE")
            font.pixelSize: 41
            lineHeightMode: Text.ProportionalHeight
            font.styleName: "Medium"
            textFormat: Text.PlainText
            renderType: Text.QtRendering
            font.family: "Encode Sans"
            layer.textureSize.height: 0
            layer.format: ShaderEffectSource.Alpha
            font.preferShaping: true
            layer.smooth: false
            styleColor: "#ffffff"
            fontSizeMode: Text.FixedSize
            layer.textureSize.width: 0
            font.kerning: false
            font.weight: Font.DemiBold
            style: Text.Normal
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#050e1d"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
    }

    Rectangle {
        id: notificationmousearea
        x: 1406
        y: 106
        width: 64
        height: 108
        opacity: 0.1
        radius: 20
        border.width: 0
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#000000"
            }

            GradientStop {
                position: 1
                color: "#324798"
            }
        }
        clip: true
    }

    Rectangle {
        id: settingMousearea
        x: 1499
        y: 168
        width: 64
        height: 108
        opacity: 0.1
        color: "#1e4690"
        radius: 20
        border.width: 0
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#000000"
            }

            GradientStop {
                position: 1
                color: "#324798"
            }
        }
        clip: true
    }




    Rectangle {
        id: journeyDoneIndication
        x: 31
        y: 213
        width: 400
        height: 110
        radius: 55
        border.color: "#000000"
        border.width: 2
        color: "#050e1d"
        clip: true

        // Gradient background
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0; color: "#050e1d" }
            GradientStop { position: 1; color: "#000000" }
        }

        // Loader progress bar
//        Rectangle {
//            id: loader
//            width: parent.width * progressBar.progress  // Width depends on progress
//            height: parent.height
//            radius: 55
//            color: "#4CAF50"  // Progress color
//            Behavior on width { NumberAnimation { duration: 500 } }
//        }

        // Overlay Rectangle
        Rectangle {
            width: parent.width
            height: parent.height / 2
            color: journeyDoneIndication.color
            radius: 0
            border.width: 0
            anchors.bottom: parent.bottom
        }

        // Text "DONE"
        Text {
            anchors.centerIn: parent
            color: "#ffffff"
            text: qsTr("DONE")
            font.pixelSize: 41
            font.weight: Font.DemiBold
            font.family: "Encode Sans"
        }

        // ProgressBar logic
        Rectangle{
            color: "#6b949e9e"
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            width: parent.width * 0.8
            height: 10
            radius: 55
        }

        Rectangle {
            id: progressBar
//            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            width: parent.width * 0.8
            height: 10
            property int progressValue // :parent.width * 0.8


//            width: progressBar.progressValue  // Width depends on progress
//            height: 5
            radius: 55

            color: "#43dff7"  // Progress color
//            Behavior on width { NumberAnimation { duration: 1000 } }

//            background: Rectangle {
//                color: "#333333"
//                radius: 5
//            }

//                color: "#4CAF50"
//                radius: 5


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
                    }
                }
            }

        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                timer.start()
                progressBar.progressValue =0
                progressBar.width=parent.width*0.8

            }
        }
    }









    Rectangle {
        id: loaderFrame
        x: 1000
        y: 250
        width: 400
        height: 110
        color: "transparent"
        radius: 60
        border.color: "#FFFFFF"   // Frame border color
        border.width: 4           // Frame border width
        clip: true

        Rectangle {
            id: jurnyDoneindication2
            anchors.fill: parent
            color: "#050e1d"
            radius: 55
            border.color: "#000000"
            border.width: 2
            clip: true

            // Background Gradient
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0; color: "#050e1d" }
                GradientStop { position: 1; color: "#000000" }
            }

            // Progress Indicator Rectangle
            Rectangle {
                id: progressBar2
                width: parent.width * progressValue  // Width based on progress
                height: parent.height
                color: "#4CAF50"  // Progress color (green)
                radius: parent.radius
                border.color: "#3b8b4e"
                border.width: 2

                Behavior on width {
                    NumberAnimation { duration: 500 } // Smooth animation for progress updates
                }
            }

            // Progress value (between 0.0 and 1.0)
            property real progressValue: 0.0

            // DONE Text
            Text {
                id: progressText
                anchors.centerIn: parent
                color: "#ffffff"
                text: progressValue === 1.0 ? qsTr("DONE") : Math.round(progressValue * 100) + "%"
                font.pixelSize: 41
                font.styleName: "Medium"
                font.family: "Encode Sans"
                font.weight: Font.DemiBold
            }

            // Timer for live progress (Demo purpose)
            Timer {
                id: progressTimer
                interval: 100
                running: true
                repeat: true
                onTriggered: {
                    if (jurnyDoneindication2.progressValue >= 1.0) {
                        progressTimer.running = false; // Stop at 100%
                    } else {
                        jurnyDoneindication2.progressValue += 0.01; // Increment progress
                    }
                }
            }
        }
    }





        Rectangle {
            // Outer Frame
            x:100
            y:300
            id: frame
            width: 400
            height: 220
            anchors.centerIn: parent
            color: "transparent"
            border.color: "#FFFFFF"  // Frame border color
            border.width: 4           // Frame border width
            radius: 20                // Rounded corners for the frame
            clip: true

            // Inner Content: Rectangle with gradient
            Rectangle {
                id: jurnyDoneindication3
                width: parent.width
                height: 110
                color: "#050e1d"
                radius: 55
                border.color: "#000000"
                border.width: 2
                clip: true

                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0; color: "#050e1d" }
                    GradientStop { position: 1; color: "#000000" }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    color: parent.color
                    radius: 0
                    border.width: 0
                    anchors.bottom: parent.bottom
                }

                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("DONE")
                    font.pixelSize: 41
                    lineHeightMode: Text.ProportionalHeight
                    font.family: "Encode Sans"
                    font.kerning: false
                    font.preferShaping: true
                    font.styleName: "Medium"
                    font.weight: Font.DemiBold
                    renderType: Text.QtRendering
                }
            }

            // Canvas: Additional area for drawing or custom content
            Canvas {
                id: canvasArea
                width: 400
                height: 100
                anchors.top: jurnyDoneindication3.bottom
//                color: "transparent"

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);  // Clear canvas on each paint
                    ctx.beginPath();
                    ctx.arc(width / 2, height / 2, 40, 0, Math.PI * 2);
                    ctx.fillStyle = "#FF5733";  // Orange color
                    ctx.fill();
                }

                // Example of live updating the canvas
                Timer {
                    id: canvasTimer
                    interval: 500
                    running: true
                    repeat: true
                    onTriggered: {
                        canvasArea.requestPaint();  // Request redraw on the canvas
                    }
                }
            }
        }



//    ScrollView {
//        width: 500
//        height: 500
//        Rectangle {
//            y: 100
//            width: 200
//            height: 200
//            color: "#3498db"
//            MouseArea {
//                anchors.fill: parent
//                onClicked: testitem.state = testitem.state === "visible" ? "hidden" : "visible"
//            }
//            transitions: [
//                Transition {
//                    SequentialAnimation {
//                        PropertyAnimation {
//                            target: testitem
//                            property: "height"
//                            duration: 700
//                            easing.type: Easing.OutQuad
//                            to: testitem.height
//                            from: 0
//                        }

//                        PropertyAnimation {
//                            target: testitem
//                            property: "y"
//                            duration: 700
//                            easing.type: Easing.InQuad
//                            to: testitem.y
//                            from: testitem.y+testitem.height
//                        }
//                    }
//                },
//                Transition {
//                    SequentialAnimation {
//                        PropertyAnimation {
//                            target: testitem
//                            property: "y"
//                            duration: 1500
//                            easing.type: Easing.InQuad
//                            to: testitem.y+testitem.height
//                            from: testitem.y
//                        }

//                        PropertyAnimation {
//                            target: testitem
//                            property: "height"
//                            duration: 1500
//                            easing.type: Easing.InQuad
//                            to: 0
//                            from: testitem.height
//                        }
//                    }
//                }]
//        }
//    }



        Item {
            id:frameofLoaders

Rectangle{
    id:topproggressBar
 x:50
 y:4
// width: 300
 width: 0
 height: 4
 color: "#43dff7"
}
Rectangle{
    id:bottomLoaderBar
 x:2
 y:104
 width: 0//396
 anchors.right: rightBarLoader.right
 height: 4
 color: "#43dff7"
}
Rectangle{
        id:rightBarLoader
 x:394
 y:50
 width: 4
 height: 0// 56
 color: "#43dff7"
}
Rectangle{
id:leftBarLoader
 x:2
 y:50
 width: 4
 height: 0//56
 color: "#43dff7"
 anchors.bottom: bottomLoaderBar.bottom
}

        Item {
            id:loaderId
//            anchors.centerIn: parent
//            anchors.fill: parent
            y:2
            x:300

            width: 100
            height: 100
         property int currentValue
            // Circular ProgressBar using Canvas
            Canvas {
                id: circularProgressBar
                anchors.centerIn: parent
                anchors.fill: parent

                antialiasing: true

                property real progress: loaderId.currentValue/100  // Progress value (0.0 to 1.0)
                property color backgroundColor: "#949e9e" // Background color
                property color progressColor: "#43dff7"   // Progress color
                property int thickness: 4  // Thickness of the circular bar
                onProgressChanged: {

                    requestPaint()
                }

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    var centerX = width / 2;
                    var centerY = height / 2;
                    var radius = (Math.min(width, height) / 2) - thickness;
        //            circularProgressBar.progress=circularProgressBar.progress/100
                    // Background Circle
//                    ctx.beginPath();
//                    ctx.lineWidth = thickness;
//                    ctx.strokeStyle = backgroundColor;
//                    ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
//                    ctx.stroke();

                    // Progress Arc
                    ctx.beginPath();
                    ctx.lineWidth = thickness;
                    ctx.strokeStyle = progressColor;
                    ctx.lineCap = "round";  // Rounded edges
                    var endAngle = 2 * Math.PI * progress// 0.25// progress;  // Calculate end angle
                    ctx.arc(centerX, centerY, radius, -Math.PI / 2, endAngle - Math.PI / 2);
                    ctx.stroke();
                }
            }

            // Text to Display Progress
        //    Text {
        //        text: Math.round(circularProgressBar.progress * 100) + "%"
        //        anchors.centerIn: parent
        //        font.pixelSize: 24
        //        color: "#333333"
        //    }
        }

        Item {
            id:loaderId2
            y:2
            width: 100
            height: 100
            property int currentValue : 0
            // Circular ProgressBar using Canvas
            Canvas {
                id:loadercanva
                anchors.centerIn: parent
                anchors.fill: parent
                antialiasing: true
                property real progress: loaderId.currentValue/100  // Progress value (0.0 to 1.0)
                property color backgroundColor: "#949e9eff" // Background color
                property color progressColor: "#43dff7"   // Progress color
                property int thickness: 4  // Thickness of the circular bar
//                onProgressChanged: {
//                    requestPaint()
//                }
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    var centerX = width / 2;
                    var centerY = height / 2;
                    var radius = (Math.min(width, height) / 2) - thickness;
                    ctx.beginPath();
                    ctx.lineWidth = thickness;
                    ctx.strokeStyle = progressColor;
                    ctx.lineCap = "round";  // Rounded edges
                    var endAngle = 2 * Math.PI * progress//0.25// progress;  // Calculate end angle
                    ctx.arc(centerX, centerY, radius, -Math.PI , endAngle - Math.PI );
                    ctx.stroke();
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        loadercanva.progress=0
                    }
                }
            }
            Timer {
                id: frameTimer
                interval: 10
                running: true
                repeat: true
                 property int buttonframeTimer
                onTriggered: {
                    buttonframeTimer=buttonframeTimer+1

                    if(buttonframeTimer<25){
                    loadercanva.progress=loadercanva.progress+0.01
                    loadercanva.requestPaint()
                    }else if(buttonframeTimer>25&&buttonframeTimer<550){
                        topproggressBar.width=topproggressBar.width+1
                    }else if(buttonframeTimer>550&&buttonframeTimer<800){
                        circularProgressBar.progress=circularProgressBar.progress+0.001
                    }else if(buttonframeTimer>800&&buttonframeTimer<856){
                        rightBarLoader.height=rightBarLoader.height+1
                    }else if(buttonframeTimer>856&&buttonframeTimer<856+396){
                        bottomLoaderBar.width=bottomLoaderBar.width+1
                    }else if(buttonframeTimer>856+394&&buttonframeTimer<856+394+56){
                        leftBarLoader.height=leftBarLoader.height+1
                    }


                }
            }

        }




}



}
