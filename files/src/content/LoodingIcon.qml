import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
//import backend 1.0
//import QtQuick.Studio.Components 1.0
//import QtQuick.Studio.LogicHelper 1.0
//Item {
//    id: outlineElipse
//    width: 36
//    height: 36
//    property int currentValue
//    ArcItem {
//        id: arc0
//        anchors.centerIn: parent
//        anchors.fill: parent
//        end:360   // rangeMapper.output
//        begin: 0 // angle
//        capStyle: 5
//        strokeWidth: 4
//        strokeColor: "#949e9e"
//        fillColor: "#0011cb20"
//        ArcItem {
//            id: arc1
//            anchors.fill: parent
//            end:outlineElipse.currentValue   // rangeMapper.output
//            begin: 0 // angle
//            capStyle: 5
//            strokeWidth: 4
//            strokeColor: "#43dff7"
//            fillColor: "#0011cb20"
//        }
//        PieItem {
//            id: pie
//            anchors.centerIn: parent
//            anchors.fill: parent
//            end: outlineElipse.currentValue
//            strokeColor: "#0011cb20"
//            fillColor: "#43dff7"

//        }
//        Text {
//            color: "#ffffff"
//            anchors.centerIn: parent
//            text: outlineElipse.currentValue.toString()+"\nsec"
//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignVCenter
//            lineHeight: 0.6
//            font.bold: true
//        }
//    }


//    BusyIndicator {
//        id: busyIndicator
//        x: 76
//        y: 79
//    }
//    width: 200
//    height: 200
//    Canvas {
//        anchors.fill: parent
//        onPaint: {
//            var ctx = getContext("2d");
//            ctx.clearRect(0, 0, width, height);

//            ctx.beginPath();
//            ctx.arc(width / 2, height / 2, 80, Math.PI / 4, 3 * Math.PI / 4); // Start and end angles in radians
//            ctx.lineWidth = 5;
//            ctx.strokeStyle = "blue";
//            ctx.stroke();
//        }


//    }


//}

Item {
    id:loaderId
//    anchors.centerIn: parent
//    anchors.fill: parent
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
            ctx.beginPath();
            ctx.lineWidth = thickness;
            ctx.strokeStyle = backgroundColor;
            ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
            ctx.stroke();

            // Progress Arc
            ctx.beginPath();
            ctx.lineWidth = thickness;
            ctx.strokeStyle = progressColor;
            ctx.lineCap = "round";  // Rounded edges
            var endAngle = 2 * Math.PI * progress;  // Calculate end angle
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
