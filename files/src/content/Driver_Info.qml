import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id:warningwindow
    z:20
    width: 808
    height:154 // 156
    color: "#0027889e"
    radius: 20
    border.width: 0
    property string driverImagePath : "images/Component 5.png" // absulute dir
    property string driverName :"Driver Name"
    property string driverIdNNumber :"12354"

    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height
        color: "#00ffffff"
        Rectangle {
            width: 92
            height: 92
            color: "#00ffffff"
            radius: 46
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            clip: true
            Image { width: 632; height: 258; anchors.centerIn: parent; source: driverImagePath}
        }
        Canvas {
            id: canvas
            anchors.fill: parent
            clip: true
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                // Fill the background transparent first
                ctx.clearRect(0, 0, width, height)
                // Draw rectangle with rounded corners
                ctx.fillStyle = "#007d99"
                var radius = 20
                ctx.beginPath()
                ctx.moveTo(radius, 0)
                ctx.lineTo(width - radius, 0)
                ctx.quadraticCurveTo(width, 0, width, radius)
                ctx.lineTo(width, height - radius)
                ctx.quadraticCurveTo(width, height, width - radius, height)
                ctx.lineTo(radius, height)
                ctx.quadraticCurveTo(0, height, 0, height - radius)
                ctx.lineTo(0, radius)
                ctx.quadraticCurveTo(0, 0, radius, 0)
                ctx.closePath()
                ctx.fill()

                // Draw transparent circle inside
                var circleX = 50+ 26
                var circleY = parent.height/2
                var circleRadius = 46
                ctx.globalCompositeOperation = "destination-out"
                ctx.beginPath()
                ctx.arc(circleX, circleY, circleRadius, 0, 2 * Math.PI)
                ctx.fill()
                ctx.globalCompositeOperation = "source-over" // reset
            }
        }
    }

    Row{
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 32+26+92
        spacing: 26
        Column{
            Text {
                color: "#ffffff"
                text: driverName
                font.pixelSize: 32
                verticalAlignment: Text.AlignVCenter
                font.family: "Encode Sans"
            }
            Row{
                spacing: 5
                Text {
                    text: "ID:"
                    color: "#8C9BB3"
                    font.pixelSize: 32
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Normal
                    font.family: "Encode Sans"
                }
                Text {
                    color: "#ffffff"
                    text:  driverIdNNumber
                    font.pixelSize: 32
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Normal
                    font.family: "Encode Sans"
                }
            }
        }
    }
}
