import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
// BackgroundDimmer.qml
//import QtQuick 2.15

Item {
    id: backgroundDimmer
    property color backgroundDimmercolor//: "#e8000818"
//    z:1
    // Container for the overlay effect
    Rectangle {
        id: dimmerOverlay
        color: backgroundDimmer.backgroundDimmercolor  // Semi-transparent dark overlay
        anchors.fill: parent
        visible: true
//        z: backgroundDimmer.z
        Behavior on color {
                ColorAnimation {
                    duration: 500 // Animation duration in milliseconds
                    easing.type: Easing.InOutQuad
                }
            }
        MouseArea {
            id: dimmerMouseArea
            anchors.fill: parent
            onClicked: {
//                if (activeItem) {
//                    activeItem = null  // Reset the active item on click outside
//                }
                inactiveareaclicked()
            }
        }

//        Component.onCompleted: visible =  true//(activeItem !== null)

        // Update visibility based on whether an item is active


//        Connections {
//            target: dimmerOverlay
//            onActiveItemChanged:visible = true//(activeItem !== null)
//        }
    }

    // Function to activate the dimming effect
    signal inactiveareaclicked()
//        dimmerOverlay.activeItem = anyid

}
