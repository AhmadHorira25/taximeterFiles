import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Item {
    width: Constants.width
    height: Constants.height

    property string kconstInputvalueBuf
    property string currencyBoxvalueBuf : currencyUnit
    property string newDatabaseOverwriteFlag
    property string newDistanceUnit : distanceUnit
    property string newApplicationTIME //: "null"

    property string newApplicationDate
    property string newApplicationTIMEhour
    property string newApplicationTIMEmin
    property string newApplicationTIMEsec
    property string newApplicationTIMEyear
    property string newApplicationTIMEmon
    property string newApplicationTIMEday


    property string newpowerOffDelay
    property string newFarecountmode
    property int  sellectedheadYpos
     property int  sellectedHight

    property string setTaximeterNightStartTimeBuff
    property string setTaximeterNightEndTimeBuff



    property string savedNightStartTime
    property string savedNightEndTime
    Connections{
         target: appUi
         property bool scrollInitTimeSetFlag: false
         property bool scrollInitTimeSetFlag2: false
        onSystem_nightStartTime:{
            if(scrollInitTimeSetFlag===false){
                scrollInitTimeSetFlag=true
           savedNightStartTime=nightStartTimeValue
            }
        }
        onSystem_nightEndTime:{
            if(scrollInitTimeSetFlag2===false){
                scrollInitTimeSetFlag2=true
                savedNightEndTime=nightEndTimeValue
            }
        }
    }




    Rectangle{
        x:0
        y:0
        width: Constants.width
        height: Constants.height
        radius: 12
        border.color: "#ffffff"
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


    Loader {
        id: keypadWindowloader

//        x: parent.parent.parent.x
//        y: parent.parent.parent.y
//        anchors.left: settingscrollwindow.left
        sourceComponent: null
    }









    property int maxLengthcounter: 0
    property var keypadWindowIDbuffer//:secandsfeild
    property string keypadinputType :"smalletter"
//    property var valedatorLimits: intonly



    Component{
        id:keypadWindow
        Key_board {
            id: myKeyBoard
            state:keypadinputType
            onPressedkey: {
                if(keyboardOut==="backspace"){
                    keypadWindowIDbuffer.text = keypadWindowIDbuffer.text.slice(0, -1);
                }else if(keyboardOut==="go"){
                    keypadWindowloader.sourceComponent = null
                    settingscrollwindow.width=2100
                    settingscrollwindow.x=230
                    customSlider.x=88
                    configurationPageexitButton.x=231
                }else{
                if(keypadWindowIDbuffer.text.length<1){
                    keypadWindowIDbuffer.text.length=30
                }
                //            if(acceptableInput){
                if(keypadWindowIDbuffer.maximumLength>keypadWindowIDbuffer.text.length){
                    keypadWindowIDbuffer.text=keypadWindowIDbuffer.text+keyboardOut
                    maxLengthcounter=maxLengthcounter+1
                }
                //}
                }
            }
        }
    }








    Item {
        id:settingscrollwindow
        x:230
        y:152
        width: 2100
        height: Constants.height-138

        property int contentheight: 620



        ScrollView {
            x:0
            y:0
            id: scrollView
            width: parent.width //- 20
            height: 438
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
            clip: true
            Flickable {
//                x:0
//                y:0
                id: flickableContent
                contentWidth: parent.width
                contentHeight:settingscrollwindow.contentheight //620// settingscrollwindow.contentheight// generalTabcontent.height//+120


//                BackgroundDimmer {
//                    id: backgroundDimmer  // This will dim the background of inactive components
////                    height: 500
////                    width: 800
//        //            x:-200
//        //            y:-100
//        //            anchors.centerIn: dataBaseoverwriteid.Center
//                    visible:  false
//                    property var diactiveAreaId
////                    anchors.fill: parent
//                                        height: parent.height
//                                        width: parent.width
//                    z:0
//                    onInactiveareaclicked: {
//                        console.log("Inactive area clicked")
//                    }
//                }

Column{
    id:scrolablegroup
    spacing: 32
//    anchors.top: parent.top
    width: scrollView.width
                Row{
                    id:buttonstabs
                    width: scrollView.width
                    height: 130
//                    anchors.top: parent.top
                  x:0
                  y:0
                    Rectangle {
                      width: parent.width
                      height: parent.height
                      color: "#00029bbe"
                      radius: 12
                      border.color: "#ffffff"
                      border.width: 0 // 1
                Rectangle {
                    x:buttonstabs.width/2
                    id:hardwaretabButton
                    width: parent.width/2
                    height: parent.height
                    color: "#029bbe"
                    radius: 12

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        Text {
                            x: 53
                            y: 40
                            color: "#ffffff"
                            text: qsTr("HARDWARE SETTINGS")
                            font.pointSize: 32
                        }

    //                  anchors.bottom: parent.top
                    onClicked: {
                        stackView2.push(harwaresettingpage)
//                        flickableContent.contentHeight=Generalconfigurationlist.implicitHeight
                        hardwaretabButton.color = "#029bbe"
                        generaltabButton.color  ="#00029bbe"

                        hardwaretabButton.border.color="#029bbe"
                        generaltabButton.border.color="#ffffff"

                        settingscrollwindow.contentheight=730
                    }
                    }

                }
                Rectangle {
                    id:generaltabButton
                    width: buttonstabs.width/2 //- 32
                    height: 130
//                    height: parent.height
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#ffffff"
                    border.width: 1

//                    anchors.right: parent.right

                    Text {
                        x: 54
                        y: 40
                        color: "#ffffff"
                        text: qsTr("GENERAL")
                        font.pointSize: 32
                    }
//                    anchors.right: parent.right
    //                  anchors.bottom: parent.top

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
    //                  anchors.bottom: parent.top
                    onClicked: {
                        stackView2.push(generalsettingpage)
//                        flickableContent.contentHeight=Generalconfigurationlist.implicitHeight
                        generaltabButton.color="#029bbe"
                        hardwaretabButton.color="#00029bbe"

                        generaltabButton.border.color="#029bbe"
                        hardwaretabButton.border.color="#ffffff"

                        settingscrollwindow.contentheight=620
                    }
                    }
                }
                  }

                }

                Row{
                    id:tabcontents
                    width: scrollView.width
//                    anchors.top: buttonstabs.bottom
                    x:0
                    y:130


            StackView {

                  id: stackView2
                  anchors.fill: tabcontents


                  pushEnter: Transition {
                          PropertyAnimation {
                              property: "opacity"
                              from: 0
                              to:1
                              duration: 100
                          }
                      }
                      pushExit: Transition {
                          PropertyAnimation {
                              property: "opacity"
                              from: 1
                              to:0
                              duration:100
                          }
                      }
                      popEnter: Transition {
                          PropertyAnimation {
                              property: "opacity"
                              from: 0
                              to:1
                              duration: 100
                          }
                      }
                      popExit: Transition {
                          PropertyAnimation {
                              property: "opacity"
                              from: 1
                              to:0
                              duration: 100
                          }
                      }

                  Component {
                      id: harwaresettingpage
                      Hardwareconfigurationlist{
                      }
                  }
                  Component {
                      id: generalsettingpage
                      Generalconfigurationlist{
                      }
                  }
                  initialItem: generalsettingpage
                  Component.onCompleted: {
                      stackView2.push(generalsettingpage)
//                      scrolablegroup.height=generalsettingpage.implicitHeight
//                      flickableContent.contentHeight=Generalconfigurationlist.implicitHeight
//                      settingscrollwindow.contentHeight=1500
                      generaltabButton.color="#029bbe"
                      hardwaretabButton.color="#00029bbe"
                      generaltabButton.border.color="#029bbe"
                      hardwaretabButton.border.color="#ffffff"

                      settingscrollwindow.contentheight=620 //500
                  }
              }
                }


}
            }
        }
}

    Rectangle {
        id: customSlider
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
            y: (customSlider.height - handle.height) * (flickableContent.contentY / (flickableContent.contentHeight - flickableContent.height))
            MouseArea {
                id:settingMouseAreabtn
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                drag.target: parent
                drag.axis: Drag.Y
                drag.minimumY: 0
                drag.maximumY: customSlider.height - handle.height
                onReleased: {
                    // Sync handle's position with content scroll when drag stops
                    flickableContent.contentY = (handle.y / (customSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
                }
                onPositionChanged: {
                    // Update content scroll position during drag
                    flickableContent.contentY = (handle.y / (customSlider.height - handle.height)) * (flickableContent.contentHeight - flickableContent.height)
                }
            }
        }
    }

    Row
    {
       x:72
       y:35
       width: 317
       height: 68
       spacing: 10
       Image {
           source: "images/Group 250 1.png"
           fillMode: Image.PreserveAspectFit
           anchors.verticalCenter: parent.verticalCenter
       }
       Text {
           width: 239
           height: 42
           color: "#ffffff"
           text: qsTr("CONFIGURATION")
           font.letterSpacing: 1.9
           font.bold: true
           font.weight: Font.Medium
           font.pointSize: 20
           font.family: "Encode Sans"
           anchors.verticalCenter: parent.verticalCenter
       }

    }

    Rectangle{
        x:0
        y:582
        height: 138
        width: 2560
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#030317BF"
            }
            GradientStop {
                position: 1
                color: "#000014"
            }
        }
Row{
    id: configurationPageexitButton

    x:231
    y: 24
    spacing: 10
        Rectangle {
//            id: configurationPageexitButton
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
                    appUi.uiSetNewKconstant(kconstInputvalueBuf)
                    appUi.uiSetNewcurrency(currencyBoxvalueBuf)

                    appUi.uiSetNewDatabaseOverwriteFlag(newDatabaseOverwriteFlag)
                    appUi.uiSetNewDistanceUnit(newDistanceUnit)

//                    newApplicationTIME = newApplicationTIMEyear+"/"+newApplicationTIMEmon+"/"+newApplicationTIMEday+"T"+newApplicationTIMEhour + ":" + newApplicationTIMEmin + ":" + newApplicationTIMEsec

                    appUi.uiSetNewApplicationTIMEyear(newApplicationTIME)
//                    appUi.uiSetNewApplicationTIMEmon(newApplicationTIMEmon)
//                    appUi.uiSetNewApplicationTIMEday(newApplicationTIMEday)
                    appUi.uiSetNewApplicationTIMEhour(newApplicationTIME)
//                    appUi.uiSetNewApplicationTIMEmin(newApplicationTIMEmin)
//                    appUi.uiSetNewApplicationTIMEsec(newApplicationTIMEsec)

                    appUi.uiSetNewFarecountmode(newFarecountmode)




                    appUi.uiSetNewPowerOffDelay(newpowerOffDelay)


                    appUi.uiconfigNightStartEndTime([setTaximeterNightStartTimeBuff,setTaximeterNightEndTimeBuff])
//



//                    pageLoader.source = "Mainconsol.qml"

                }
            }
        }
        Rectangle {
//            id: configurationPageexitButton
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
                    if(keypadWindowloader.sourceComponent == keypadWindow){

                        keypadWindowloader.sourceComponent = null
                        settingscrollwindow.width=2100
                        settingscrollwindow.x=230
                        customSlider.x=88
                        configurationPageexitButton.x=231
                        listDimmer.visible=  false
                        focusAreaId.parent.parent.z=0
                        avtiveAreaId = null
                        focusAreaId.focus = false
                        focusAreaId.clearFocus()
                        focusAreaId = null
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
