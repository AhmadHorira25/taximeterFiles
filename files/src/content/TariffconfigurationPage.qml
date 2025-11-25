import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Item {
    width: Constants.width
    height: Constants.height
    Rectangle{
        x:0
        y:0
        width: Constants.width
        height: Constants.height
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#000426"
            }
            GradientStop {
                position: 0.5
                color: "#000014"
            }
            GradientStop {
                position: 1
                color: "#000426"
            }
        }
    }

    property string newinitialTime
    property string newinitialhirefee
    property string newtariffPerK
    property string newtariffPerH
    property string newinitialDistance
    property string newfareIncrement
//    property string newExtraCharges


    property string newinitialTime_night
    property string newinitialhirefee_night
    property string newtariffPerK_night
    property string newtariffPerH_night
    property string newinitialDistance_night



    property bool keyPadFlag: false
    property var focusAreaIdBuf



//    Component{
//        id:tariffkeypadWindow
//        MyKeyBoard {
//            state:keypadinputType
//            onPressedkey: {
//                if(keyboardOut==="backspace"){
//                    tariffkeypadWindowIDbuffer.text = tariffkeypadWindowIDbuffer.text.slice(0, -1);
//                }else if(keyboardOut==="go"){
//                    tariffkeypadWindowloader.sourceComponent = null
//                    tariffscrollwindow.width=2100
//                    tariffscrollwindow.x=230
//                    tariffcustomSlider.x=88
//                    tariffpageExitButton.x=231
//                }else{
//                if(tariffkeypadWindowIDbuffer.text.length<1){
//                    tariffkeypadWindowIDbuffer.text.length=30
//                }
//                if(tariffkeypadWindowIDbuffer.maximumLength>tariffkeypadWindowIDbuffer.text.length){
//                    tariffkeypadWindowIDbuffer.text=tariffkeypadWindowIDbuffer.text+keyboardOut
//                    maxLengthcounter=maxLengthcounter+1
//                }
//                }
//            }
//        }
//    }

    Loader {
        id: tariffkeypadWindowloader

        //        x: parent.parent.parent.x
        //        y: parent.parent.parent.y
        //        anchors.left: settingscrollwindow.left
        sourceComponent: null
    }

    Item {
        id:tariffscrollwindow
        x:230
        y:152
        width: 2100
        height: Constants.height-138


        ScrollView {
            x:0
            y:0
            id: scrollView
            width: parent.width //- 20
            height: 438
            clip: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff

            Flickable {
                //                x:0
                //                y:0
                id: flickableContent
                contentWidth: parent.width
                contentHeight: 980+380// generalTabcontent.height//+120

                Column{
                    id:tariffscrolablegroup
                    spacing: 32
                //    anchors.top: parent.top
                    width: scrollView.width


                    Row{
                        spacing: 32
                        width: (tariffTabcontent.width) //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                //        height: 138.04
                //        x:(tariffTabcontent.width)
                        y:50


                        Image {
                            source: "images/meter 1.png"
                        }
                        Text {
                            color: "#ffffff"
                            text: qsTr("TARIFF PARAMETERS")
                            font.pixelSize: 40
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                        }
                    }


                                Row{
                                    id:tabcontents
                                    width: scrollView.width
                                    y:60
                                    TariffconfigurationparameterTabList{
                                    }
//                            StackView {
//                                  id: stackView2
//                                  anchors.fill: tabcontents
//                                  Component {
//                                      id: generalsettingpage
//                                      TariffconfigurationparameterTabList{
//                                      }
//                                  }
//                                  initialItem: generalsettingpage
//                                  Component.onCompleted: {
//                                      stackView2.push(generalsettingpage)
//                                  }
//                              }
                                }


                }

            }
        }
    }

    Rectangle {
        id: tariffcustomSlider
        x: 96
        y: 154
        width: 20
        height: scrollView.height
        color: "transparent"
        Rectangle {
            width: 16
            height: parent.height
            anchors.centerIn: parent
            color: "#082F43"
            radius: 90
            border.width: 0
        }

        // Rectangular Handle (draggable knob)
        Rectangle {
            id: handle
            width: 32
            height: 230   // Make the handle taller for better interaction
            color: "#029BBE"
            border.color: "#ffffff"
            border.width: 0
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 30
            // Calculate position based on content scroll
            y: (tariffcustomSlider.height - handle.height) * (flickableContent.contentY / (flickableContent.contentHeight - flickableContent.height))
            MouseArea {
                id:settingMouseAreabtn
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                drag.target: parent
                drag.axis: Drag.Y
                drag.minimumY: 0
                drag.maximumY: tariffcustomSlider.height - handle.height
                onReleased: {
                    // Sync handle's position with content scroll when drag stops
                    flickableContent.contentY = (handle.y / (tariffcustomSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
                }
                onPositionChanged: {
                    // Update content scroll position during drag
                    flickableContent.contentY = (handle.y / (tariffcustomSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
                }
            }
        }
    }



    Row{
        x:72
        y:35
        height: 74
        spacing: 10
        Image {
            source: "images/Group 251 1.png"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            color: "#ffffff"
            text: qsTr("TARIFF")
            font.pointSize: 28
            font.family: "Encode Sans"
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle{
        x:0
        y:582
        height: 138
        width: 2560
        //        color: "#030317BF"
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                //                id:/*hireButtonGrad1a*/
                position: 0
                color: "#030317BF"
            }
            GradientStop {
                //                id:hireButtonGrad1b
                position: 1
                color: "#000014"
            }
        }
        Row{
            id: tariffpageExitButton

            x:231
            y: 24
            spacing: 10
            Rectangle {
                //            id: tariffpageExitButton
                //            x: 231
                //            y: 24
                width: 586
                height: 82
                color: "#029BBE"
                radius: 12
                border.color: "#029BBE"
                border.width: 2
                Text {
                    //                id: text1
                    anchors.centerIn: parent

                    color: "#ffffff"
                    text: qsTr("SAVE")
                    font.pixelSize: 32
                    font.weight: Font.Bold
                    font.family: "Roboto Condensed"
                }
                MouseArea{
                    //                id: settingExitbuttonArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        //                    hireConsole.visible=true
                        //                    tabscoslewndw.visible=true
                        //                    settingoagewindowe.visible=false
                        //                    mainWindowLoader.source = "Mainconsol.qml"

                        //                    property string newinitialTime
                        //                    property string newinitialhirefee
                        //                    property string newtariffPerK
                        //                    property string newtariffPerH
                        //                    property string newinitialDistance
                        //                    property string newfareIncrement


                        appUi.uiSetNewInitialTime(newinitialTime)
                        appUi.uiSetNewInitialhirefee(newinitialhirefee)
                        appUi.uiSetNewTariffPerK(newtariffPerK)
                        appUi.uiSetNewTariffPer(newtariffPerH)
                        appUi.uiSetNewInitialDistance(newinitialDistance)
//                        appUi.uiSetNewFareIncrement(newfareIncrement)
//                        appUi.uiSetNewMoneyExtras(newExtraCharges)

                        appUi.uiSetNewInitialTimeNight(newinitialTime_night)
                        appUi.uiSetNewInitialhirefeeNight(newinitialhirefee_night)
                        appUi.uiSetNewTariffPerKNight(newtariffPerK_night)
                        appUi.uiSetNewTariffPerNight(newtariffPerH_night)
                        appUi.uiSetNewInitialDistanceNight(newinitialDistance_night)






//                        if(tariffkeypadWindowloader.sourceComponent === tariffkeypadWindow){
                                        tariffkeypadWindowloader.sourceComponent = null
                                        tariffscrollwindow.width=2100
                                        tariffscrollwindow.x=230
                                        tariffcustomSlider.x=88
                                        tariffpageExitButton.x=231
                                        focusAreaIdBuf = null
//                        }

//                        pageLoader.source = "Mainconsol.qml"

                    }
                }
            }
            Rectangle {
                //            id: tariffpageExitButton
                //            x: 231
                //            y: 24
                width: 586
                height: 82
                color: "#00ffffff"
                radius: 12
                border.color: "#ffffff"
                border.width: 1
                Text {
                    //                id: text1
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("BACK")
                    font.pixelSize: 32
                    font.weight: Font.Bold
                    font.family: "Roboto Condensed"
                }
                MouseArea{
                    //                id: settingExitbuttonArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        //                    hireConsole.visible=true
                        //                    tabscoslewndw.visible=true
                        //                    settingoagewindowe.visible=false
                        //                    mainWindowLoader.source = "Mainconsol.qml"
                        //                    pageLoader.source = "Mainconsol.qml"
                        if(keyPadFlag===true){
                            tariffkeypadWindowloader.sourceComponent = null
                            keyPadFlag=false


//                                        tariffkeypadWindowloader.sourceComponent = null
                                        tariffscrollwindow.width=2100
                                        tariffscrollwindow.x=230
                                        tariffcustomSlider.x=88
                                        tariffpageExitButton.x=231
                            //            tarifflistDimmer.visible=  false
                            //            focusAreaId.parent.parent.z=0

//                                        tariffTabcontent.avitveChildId= null
//                                        focusAreaId.focus = false
//                                        focusAreaId.clearFocus()
                             focusAreaIdBuf.parent.parent.color="#00029bbe"




                            if(focusAreaIdBuf===null){//focusAreaId
                            }else{
                                focusAreaIdBuf.parent.parent.color="#00029bbe"
                                if(focusAreaIdBuf.text===""){
                                    focusAreaIdBuf.text= focusAreaIdBuf.previousValue
                                    console.log("focusAreaIdBuf value text after back : ",focusAreaIdBuf.previousValue)
                                }
                            }



                                        focusAreaIdBuf = null

                        }else{
                             pageLoader.source = "AddminPage.qml"
                        }



                    }
                }
            }
        }
    }

    //    MyKeyBoard {
    //        id: myKeyBoard
    //        x: 0
    //        y: 0
    //    }
}
