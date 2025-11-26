

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    BorderImage {
        id: borderImage
        x: 8
        y: 8
        width: 2531
        height: 694
        source: "images/Splash Screen.png"

        TextInput {
            id: textInput1test
            x: 1704
            y: 241
            width: 80
            height: 22
            color: "#d0b3ad"
            text: qsTr("Text Input")
            font.pixelSize: 12
            selectionColor: "#ee0000"
            transformOrigin: Item.Center
        }

        Label {
            id: label1test
            x: 1704
            y: 203
            width: 245
            height: 54
            text: qsTr("Label")

            Connections {
                target: back
                onValueChanged: label1test.text = s
                //                onLineLaidOut: rectangle.state = ""
            }
        }


    }

    Button {
        id: button
        text: qsTr("Press me")
        anchors.verticalCenter: parent.verticalCenter
        flat: true
        highlighted: true
        anchors.verticalCenterOffset: -185
        anchors.horizontalCenterOffset: 473
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: button
            //            onClicked: animation.start()
            onClicked: back.changeValue(textInput1test.text)
        }
    }

    Text {
        id: label
        text: qsTr("Hello UntitledProject3")
        anchors.top: button.bottom
        font.family: Constants.font.family
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter

        SequentialAnimation {
            id: animation

            ColorAnimation {
                id: colorAnimation1
                target: rectangle
                property: "color"
                to: "#2294c6"
                from: Constants.backgroundColor
            }

            ColorAnimation {
                id: colorAnimation2
                target: rectangle
                property: "color"
                to: Constants.backgroundColor
                from: "#2294c6"
            }
        }
    }

    states: [
        State {
            name: "clicked"
            when: button.checked

            PropertyChanges {
                target: label
                text: qsTr("Button Checked")
            }
        },
        State {
            name: "State1"
        }
    ]
}
