import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."

Row{
    id : hardwaresettingTabcontent
    spacing: 32
    width:parent.width
    property var hardwaravtiveAreaId//:overwritedataBaseDropbox
    property var focusAreaId
    property bool focusAreaFlage: false
    property bool timeChangedFlag: false

    //    Connections {
    //        target: timeValue
    //        onTimeValueChanged: {
    //            hourfeildset.text = Qt.formatDateTime(timeValue,"HH")
    //            minfeildset.text = Qt.formatDateTime(timeValue,"mm")
    //            secfeildset.text = Qt.formatDateTime(timeValue,"ss")
    //            yearfeildset.text = Qt.formatDateTime(timeValue,"yyyy")
    //            monfeildset.text = Qt.formatDateTime(timeValue,"MM")
    //            dayfeildset.text = Qt.formatDateTime(timeValue,"dd")
    //        }
    //    }
    //    Connections {
    //        id:timeinputField
    //        target: appUi
    ////                onValueChanged: label1test.text = Kconst
    //onSystem_applicationTIME:{applicationTIMEValue}
    //    }

    Connections {//make it just in open(oncompleted)
        id:timeinputField
        target: appUi
        //                onValueChanged: label1test.text = Kconst
        onSystem_applicationTIME:{

            if(timeChangedFlag===false){
                timeChangedFlag=true
//                hourList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"HH")
//                minuteList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"mm")
//                secondList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"ss")
//                yearList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"yy")//admin
//                monthList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"MM")
//                dayList.currentIndex = Qt.formatDateTime(applicationTIMEValue,"dd")
//                newApplicationTIMEhour=hourList.currentIndex
//                newApplicationTIMEsec=secondList.currentIndex
//                newApplicationTIMEmin=minuteList.currentIndex
//                newApplicationTIMEday=dayList.currentIndex
//                newApplicationTIMEmon=monthList.currentIndex
//                newApplicationTIMEyear=yearList.currentIndex
//                 setTaximeterLocalDate.scrollInitDate=Qt.formatDateTime(applicationTIMEValue,"yyyy:MM:dd")
                 timeValue= applicationTIMEValue
//                 setTaximeterLocalTime.scrollInitTime=Qt.formatDateTime(applicationTIMEValue,"HH:mm:ss ap")
//                setTaximeterLocalTime

            }

            //                                            if(initialhirefeetextfeild.oldvalue!==applicationTIMEValue)
            //                                            {
            //                                            initialhirefeetextfeild.text = applicationTIMEValue
            //                                            initialhirefeetextfeild.oldvalue = applicationTIMEValue
            //                                                formatTime(applicationTIMEValue)
            //                                                newApplicationTIMEhour = applicationTIMEValue
            //                                            }
        }
    }



    Rectangle
    {
                id: rectangle
                y: 290+130+32
                width: parent.width
                height: 130
                color: "#00029bbe"
                radius: 12
                border.color: "#029bbe"
                border.width: 1
                Row{
                    x: 22
                    y: 46
                    spacing: 28
                    height: 47
                    Image {
                        source: "images/meter 1.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        width: 457
                        text: "Journy timing Source"
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "Roboto"
                        font.pointSize: 40
                        color: "#0fe6ef"
                    }
                    Text{
                        width: 200
                    }

                    Rectangle {
                        width: 230*2+16
                        height: 50
                        color: "#00029bbe"
                        radius: 12
                        border.color: "#ffffff"
                        border.width: 0
                        anchors.verticalCenter: parent.verticalCenter

                        Row{
                            id:buttonstabs
                            //                width: parent.width
                            height: 130
                            spacing: 8
                            Rectangle {
                                id:hardwaretabButton
                                width: 230
                                height: 50
                                color: "#029bbe"
                                radius: 12
                                border.color: "#029bbe"
                                Text {
                                    color: "#ffffff"
                                    text: qsTr("INTERNAL")
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.pointSize: 32
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        hardwaretabButton.color = "#029bbe"
                                        generaltabButton.color  ="#00029bbe"

                                        generaltabButton.border.color="#ffffff"
                                        hardwaretabButton.border.color="#029bbe"
                                    }
                                }
                            }
                            Rectangle {
                                id:generaltabButton
                                width:230 //- 32
                                height: 50
                                color: "#00029bbe"
                                radius: 12
                                border.color: "#ffffff"
                                Text {
                                    color: "#ffffff"
                                    text: qsTr("EXTERNAL")
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.pointSize: 32
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        generaltabButton.color="#029bbe"
                                        hardwaretabButton.color="#00029bbe"

                                        generaltabButton.border.color="#029bbe"
                                        hardwaretabButton.border.color="#ffffff"

                                    }
                                }
                            }
                        }
                    }
                }
            }




    Rectangle{
        color: "#00ffffff"
        border.color: "#00000000"
        anchors.fill: parent.parent
        width: hardwaresettingTabcontent.width
        height: hardwaresettingTabcontent.height

        Rectangle {
            id:timechangebox
            y:24
            x:0
            width: (parent.width)//width: (settingscrollwindow.width-32)-2//width: settingscrollwindow.width * 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
            height: 120*2
            color: "transparent"
            radius: 12
            border.color: "#117BB1"
            border.width: 2
            Column{
                anchors.verticalCenter: parent.verticalCenter
                spacing: 50
                Row{
                    id:localTimeRow
                    x: 22
                    width: 1718
                    spacing: 28
                    height: 47
                    Image {
                        source: "images/meter 1.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        text: "Set Taximeter Time"
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "Roboto"
                        font.pointSize: 40
                        color: "#0fe6ef"
                        width: 457
                    }
                    Text {
                        width: 200
                    }





                    property string timeValueBuf//: timeValue
                    property string localTimeHolder
                    Component.onCompleted: {
                         timeValueBuf= timeValue
                         setTaximeterLocalTimeLoader.sourceComponent=setTaximeterLocalTimeComponent
                    }


                    Loader{
                        id:setTaximeterLocalTimeLoader
                        sourceComponent: null
                    }
                    Component{
                        id:setTaximeterLocalTimeComponent
                        TimeSelectScroll{
                            id:setTaximeterLocalTime
                            width: 550
                            state: "timeinput"
                            scrollInitTime :timeValue
                            Component.onCompleted: {
                                scrollInitTime =timeValue
                            }
                            onOutputTimeChanged: {
                                localTimeRow.localTimeHolder = outputTime
                                newApplicationTIME=outputTime+" "+localDateRow.localDateHolder
                            }
                        }
                    }


//                    TimeSelectScroll{
//                        id:setTaximeterLocalTime
//                        width: 500
//                        state: "timeinput"
////                        scrollInitTime:timeValue
//                        Component.onCompleted: {
//                            console.log("ccccccccc zzzzzz timeValue - hardware :",timeValue," ",outputTime)
////                            setTaximeterLocalTime.scrollInitTime=timeValue
////                            newApplicationTIME=timeValue
//                        }

//                        scrollInitTime:timeValue//  "null" ? timeValue : newApplicationTIME  // "07:11:52 AM" //Qt.formatDateTime(timeValue,"hh:mm:ss ap")
//                        onOutputTimeChanged: {
////                            console.log("outputTime - hardware :",outputTime)
//                            newApplicationTIME=outputTime+" "+setTaximeterLocalDate.outputDate
//                            console.log(" >>>>>>>>>>>>>>>>>> outputTime - newApplicationTIME :",newApplicationTIME)
//                        }
//                    }
                }
                Row {
                    id:localDateRow
                    x: 22
                    width: 1718
                    spacing: 28
                    Image {
                        source: "images/meter 1.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        width: 457
                        text: "Set Taximeter Date"
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "Roboto"
                        font.pointSize: 40
                        color: "#0fe6ef"
                    }
                    Text {
                        width: 200
                    }



                    property string dateValueBuf//: timeValue
                    property string localDateHolder
                    Component.onCompleted: {
                         dateValueBuf= timeValue
                         setTaximeterLocalDateLoader.sourceComponent=setTaximeterLocalDateComponent
                    }


                    Loader{
                        id:setTaximeterLocalDateLoader
                        sourceComponent: null
                    }
                    Component{
                        id:setTaximeterLocalDateComponent
                        TimeSelectScroll{
                            id:setTaximeterLocalDate
                            width: 550
                            state: "dateinput"
                            scrollInitDate:timeValue
                            Component.onCompleted: {
                                scrollInitTime =timeValue
                            }
                            onOutputDateChanged: {
                                localDateRow.localDateHolder = outputDate
                                newApplicationTIME=localTimeRow.localTimeHolder+" "+outputDate
                            }
                        }
                    }

                }
            }
        }

        Rectangle {
            y: 290
            width: parent.width
            height: 149
            color: "#00029bbe"
            radius: 12
            border.color: "#029bbe"
            border.width: 1
            Row{
                id: daynightSet
//                property string savedNightStartTime
//                property string savedNightEndTime

                Connections{
                     target: appUi
                     property bool scrollInitTimeSetFlag: false
                     property bool scrollInitTimeSetFlag2: false
                    onSystem_nightStartTime:{
                        if(scrollInitTimeSetFlag===false){
                            scrollInitTimeSetFlag=true
//                       savedNightStartTime=nightStartTimeValue


                        console.log("nightStartTimeValue  :",nightStartTimeValue,"   ,",Qt.formatDateTime(nightStartTimeValue,"HH:mm:ss ap"))
                            setTaximeterNightStartTimeLoader.sourceComponent=setTaximeterNightStartTimeComponent

                        }
                    }

                    onSystem_nightEndTime:{

                        if(scrollInitTimeSetFlag2===false){
                            scrollInitTimeSetFlag2=true
//                            savedNightEndTime=nightEndTimeValue
                        setTaximeterNightEndTimeLoader.sourceComponent=setTaximeterNightEndTimeComponent
                        console.log("nightEndTimeValue  :",nightEndTimeValue,"   ,",Qt.formatDateTime(nightEndTimeValue,"HH:mm:ss ap"))
                        }

                    }

                }





                x: 22
                y: 46
                spacing: 28
                height: 47
                Image {
                    source: "images/meter 1.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    width: 457
                    text: "Night Time"
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "Roboto"
                    font.pointSize: 40
                    color: "#0fe6ef"
                }
                Text{
                    width: 200
                }
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8
                    Text {
                        color: "#ffffff"
                        text: "Night Start Time"
                        font.pixelSize: 36
                        font.family: "Roboto"
                    }




                    Loader{
                        id:setTaximeterNightStartTimeLoader
                        sourceComponent: null
                    }
                    Component{
                        id:setTaximeterNightStartTimeComponent
                        TimeSelectScroll{
                            id:setTaximeterNightStartTime
                            width: 550
                            state: "timeinput"
                            scrollInitTime :savedNightStartTime
                            Component.onCompleted: {
                                scrollInitTime =savedNightStartTime
                            }
                            onOutputTimeChanged: {
                                setTaximeterNightStartTimeBuff=outputTime
                            }
                        }
                    }









                }

                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8
                    Text {
                        color: "#ffffff"
                        text: "Night End Time"
                        font.pixelSize: 36
                        font.family: "Roboto"
                    }

                Loader{
                    id:setTaximeterNightEndTimeLoader
                    sourceComponent: null
                }
                Component{
                    id:setTaximeterNightEndTimeComponent
                    TimeSelectScroll{
                        id:setTaximeterNightEndTime
                        width: 550
                        state: "timeinput"
                        scrollInitTime :savedNightEndTime
                        Component.onCompleted: {
                            scrollInitTime =savedNightEndTime
                        }
                        onOutputTimeChanged: {
                            setTaximeterNightEndTimeBuff=outputTime
                        }
                    }
                }

                }



            }
        }
    }

    onFocusAreaFlageChanged: {

        if (focusAreaFlage===true) {
            keypadWindowloader.sourceComponent = null
            settingscrollwindow.width=2100
            settingscrollwindow.x=230
            customSlider.x=88
            configurationPageexitButton.x=231
            focusAreaId.parent.parent.parent.parent.parent.z=0
            focusAreaId.focus = false
            focusAreaId.clearFocus()
            focusAreaId = null
            timeinputField.enabled=true
        } else {
            focusAreaId.focus = true
            focusAreaId.forceActiveFocus()
            keypadinputType="numbersstate"
            keypadWindowloader.sourceComponent = keypadWindow
            settingscrollwindow.width=1550
            settingscrollwindow.x=882
            customSlider.x=2461
            keypadWindowIDbuffer  = focusAreaId
            keypadWindowIDbuffer.placeholderText = keypadWindowIDbuffer.text
            keypadWindowIDbuffer.text=""
            configurationPageexitButton.x=882
            focusAreaId.parent.parent.parent.parent.parent.z=1
            focusAreaId.parent.z=1
            timeinputField.enabled=false
        }
    }
}
