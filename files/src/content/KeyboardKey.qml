import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    id:customKeyboard
    property string keyValue: " "
//    property int keyWidth: 70
    property bool textVisible: true
    property color keycolor: "#3f3f3f"
    property int keyBorderWidth: 0
    property color keyBorderColor: "#ffffff"// "#20010217" // "#ffffff" // customKeyboard.keycolor
    signal keyPressed(string key)
color: "#FFFFFF"  //"#3f3f3f"
radius: 9.48
border.color: keyBorderColor // "#ffffff"
border.width: 0
    height: 86.56
    width:72.53
    Text {
        id:keyText
        visible: customKeyboard.textVisible
        color: "#000000"
        text: qsTr(customKeyboard.keyValue)
        font.pointSize: 51
        anchors.centerIn: parent
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        enabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
//            customKeyboard.color ="#812773"
            keyPressed(customKeyboard.keyValue)
        }

        onPressed: {
//            customKeyboard.color ="#999933"
            customKeyboard.border.width=3
            keyText.font.pointSize=keyText.font.pointSize-3
            shadow.visible=false
        }
        onReleased:{
//            customKeyboard.color = customKeyboard.keycolor
            customKeyboard.border.width=0
            keyText.font.pointSize=keyText.font.pointSize+3
            shadow.visible=true
        }
    }
    Rectangle{
        id:shadow
        width: parent.width
        color: "#636161"
        border.width: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -4
        anchors.horizontalCenter: parent.horizontalCenter
        radius: parent.radius
        height: parent.height
        z:-1
    }
}
