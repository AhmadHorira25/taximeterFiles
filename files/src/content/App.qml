/* This file is generated and only relevant for integrating the project into a Qt 6 and cmake based
C++ project. */

import QtQuick 2.15
//import QtQuick.Controls 2.0
import QtQuick.Controls 2.15
//import QtQuick.Window 2.0
import QtQuick.Window 2.15
import UntitledProject3 1.0
import "."
//import QtQuick.VirtualKeyboard 2.15
//ApplicationWindow {
Window   {
    id:mainWindow
    visible: true
//    visibility: Window.FullScreen // 24/6/25
    width: Constants.width
    height: Constants.height
//    title: qsTr("Single Window with Multiple Pages")
// property int myInt: 0
    // Loader to dynamically load different QML pages


//    Component{
//        id:adminLogginPage
//        LogginPage{  // "LogginPage.qml"
//                     loginTargetPage:  "AddminPage.qml"
//            }
//    }

    Loader {
        id: pageLoader
        anchors.fill: parent
//        LogginPage{  // "LogginPage.qml"
//                     id:userLogginPage
//                     loginTargetPage: "Mainconsol.qml"
//            }
         source : "Mainconsol.qml"//"LogginPage.qml"
    }

    FontLoader {
        id: encodesans
        name: "encodesans"
        source: "fonts/EncodeSans-Medium.ttf"

    }
    FontLoader {
        id: montserratMedium
        name: "encodesans"
        source: "fonts/Montserrat-Medium.ttf"
    }
    FontLoader {
        id: robotoMedium
        name: "encodesans"
//        source: "fonts/Roboto-Medium.ttf"//RobotoCondensed-Bold.ttf
        source: "fonts/."
    }
    FontLoader {
        id: robotoCondensed
        name: "Roboto Condensed"
//        source: "fonts/Roboto-Medium.ttf"//RobotoCondensed-Bold.ttf
        source: "fonts/RobotoCondensed-Bold.ttf"
    }

    FontLoader {
        id: sFPRODISPLAYREGULAR_OTF
        name: "Roboto Condensed"
//        source: "fonts/Roboto-Medium.ttf"//RobotoCondensed-Bold.ttf
        source: "fonts/SFPRODISPLAYREGULAR.OTF"
    }





    HeadBar{
    id : thisHead
    x: 0
    y: 0
    }


    // Default page when the window opens
    Component.onCompleted: {
//        pageLoader.source = "ButtonsPage.qml"
//        pageLoader.source = "LogginPage.qml"
//         Qt.application.font.family = customFont.encodesans
    }

property string currencyUnit :"AED" //: value

    Connections {
        target: appUi
        onSystem_currencyUnit: {
            currencyUnit = currencyUnitvalue
        }
    }

    property string distanceUnit :"km" //: value
    property string timeValue
        Connections {
            target: appUi
            onSystem_distanceUnit: {
                distanceUnit = system_distanceUnitValue
            }
        }



            Connections {
//                id:timeinputField
                target: appUi
        //                onValueChanged: label1test.text = Kconst
        onSystem_applicationTIME:{
            timeValue=applicationTIMEValue
        }
            }



            Rectangle{
                visible: false
                anchors.fill: parent
                color: "#99010219"
                z:19
                MouseArea{
                    anchors.fill: parent
                }

//                property bool warningwindowVisiple: false

                Rectangle{
//                    id:warningwindow
                    x: 876
                    y: 405
                    z:20
                    width: 808
                    height: 156
                    visible: false
                    color: "#c1010219"
                    radius: 20
                    border.width: 0
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
                        id: faultBox
                        property string secandsLeft_off
                    Text {
                        color: "#bfffffff"
                        text: "ignition off , left "
                        font.pixelSize: 20
                        font.family: "Encode Sans"
                    }
                    Text {
                        color: "#bfffffff"
                        width: 50
                        text: faultBox.secandsLeft_off
                        font.pixelSize: 20
                        font.family: "Encode Sans"
                    }
                    Text {
                        color: "#bfffffff"
                        text: " (sec) before turn off"
                        font.pixelSize: 20
                        font.family: "Encode Sans"
                    }
                    }
                }
                }


}


            property string warningwindowMsg: "no warning"
            property bool newwarningMsgIndication: false

            Connections {
                target: appUi
//                onValueChanged: label1test.text = Kconst
                onSystem_warningMsg:{
                    if(warningwindowMsg!==warningMsg){
                    warningwindowMsg=warningMsg
                        mainWindow.newwarningMsgIndication = true
                    }
                }
            }




            Connections {
                target: appUi
//                onValueChanged: label1test.text = Kconst
                onSystem_powerOffCountup:{
                    faultBox.secandsLeft_off=powerOffCountupValue
                }
            }


            property string hirePositionflag: "waitingHire"
            property bool navigationFlag : true
            Connections {
                target: appUi
                onSystem_hireState:{
                  hirePositionflag =  hireStateVAlue
                }
            }


            Connections {
                target: appUi
                onSystem_fault:{

                }
            }



}
