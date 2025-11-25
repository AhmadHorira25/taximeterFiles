import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Item {
    id: dateTimeScrollId
    width:350// Constants.width
    height:57// Constants.height

    property string outputTime
    property string outputDate

    property string scrollInitTime //: "09:22:35"
    property string scrollInitDate



//    property string hourStr
//    property string chatr
//    property string scrollInitDate
//    property string scrollInitDate





    Component.onCompleted: {
        //        hoursfeild.startValue = Qt.formatDateTime(scrollInitTime,"hh ap")
        //        minFeild.startValue = Qt.formatDateTime(scrollInitTime,"mm")
        //        secandsFeild.startValue = Qt.formatDateTime(scrollInitTime,"ss")

        //        yearfeild.startValue = Qt.formatDateTime(dateTimeScrollId.scrollInitDate,"yy")//admin
        //        monthFeild.startValue = Qt.formatDateTime(dateTimeScrollId.scrollInitDate,"MM")
        //        dayFeild.startValue = Qt.formatDateTime(dateTimeScrollId.scrollInitDate,"dd")

        if(Qt.formatDateTime(scrollInitTime,"ap")==="am"){
            hardwaretabButton.color = "#029bbe"
            generaltabButton.color  ="#00029bbe"
            hardwaretabButton.border.color="#029bbe"
            generaltabButton.border.color  ="#ffffff"
        }else if(Qt.formatDateTime(scrollInitTime,"ap")==="pm"){
            generaltabButton.color="#029bbe"
            hardwaretabButton.color="#00029bbe"
            generaltabButton.border.color="#029bbe"
            hardwaretabButton.border.color  ="#ffffff"
        }

//        console.log("os timeValue",dateTimeScrollId.scrollInitTime)
        //         console.log("hoursfeild.newValue",hoursfeild.startValue)
        //        hardwaretabButton.color = "#029bbe"
        //        generaltabButton.color  ="#00029bbe"
        //        dateTimeScrollId.outputTime=   Qt.formatDateTime(timeValue,"hh") +":"+Qt.minFeild.startValue+":"+Qt.secandsFeild.startValue+" "+Qt.formatDateTime(timeValue,"AM")
    }


    Row{
        id: timerow
        anchors.verticalCenter: parent.verticalCenter
        spacing: 9

        property string timeAPm:Qt.formatDateTime(scrollInitTime,"ap")// "am"
        SpanBoxScroll{
            id:hoursfeild
            width: 73
            height: 57
            color: "#00ffffff"
            radius: 4
            border.color: "#ffffff"
            minValue: 1
            function convertTo12Hour(hour) {
                hour = parseInt(hour, 10); // Convert string to number
                return hour === 0 ? 12 : (hour > 12 ? hour - 12 : hour);
            }
            startValue: convertTo12Hour(Qt.formatDateTime(dateTimeScrollId.scrollInitTime,"hh"))// 1//Qt.formatDateTime(applicationTIMEValue,"MM")//admin
                        newValue: startValue
            maxValue: 12
            onNewValueChanged: {
                if(newValue  < 10 ){
                     newValueStr = "0"+newValue
                }else{
                    newValueStr = newValue
                }

                dateTimeScrollId.outputTime=  newValueStr +":"+minFeild.newValueStr+":" +secandsFeild.newValueStr+" "+timerow.timeAPm //Qt.formatDateTime(timeValue,"ap")
//                 console.log("========================dateTimeScrollId.outputTime : " , dateTimeScrollId.outputTime)
            }

        }
        Text {
            height: 59
            color: "#ffffff"
            text: qsTr(":")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 40
            font.family: "Roboto Condensed"
        }
        SpanBoxScroll{
            id:minFeild
            width: 73
            height: 57
            color: "#00ffffff"
            radius: 4
            border.color: "#ffffff"
                        newValue: startValue
            minValue: 0
            startValue:Qt.formatDateTime(dateTimeScrollId.scrollInitTime,"mm")// 0//Qt.formatDateTime(applicationTIMEValue,"MM")//admin
            maxValue: 59
            onNewValueChanged: {
                if(newValue  < 10 ){
                     newValueStr = "0"+newValue
                }else{
                    newValueStr = newValue
                }
                dateTimeScrollId.outputTime=   hoursfeild.newValueStr+":"+newValueStr+":" +secandsFeild.newValueStr+" "+timerow.timeAPm//Qt.formatDateTime(dateTimeScrollId.scrollInitTime,"ap")
            }

        }
        Text {
            height: 59
            color: "#ffffff"
            text: qsTr(":")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 40
            font.family: "Roboto Condensed"
        }
        SpanBoxScroll{
            id:secandsFeild
            width: 73
            height: 57
            color: "#00ffffff"
            radius: 4
            border.color: "#ffffff"
            minValue: 0
            startValue: Qt.formatDateTime(dateTimeScrollId.scrollInitTime,"ss") //0
                        newValue: startValue
            maxValue: 59
            onNewValueChanged: {
                if(newValue  < 10 ){
                     newValueStr = "0"+newValue
                }else{
                    newValueStr = newValue
                }
                dateTimeScrollId.outputTime=   hoursfeild.newValueStr +":"+minFeild.newValueStr+":"+newValueStr +" "+timerow.timeAPm//Qt.formatDateTime(dateTimeScrollId.scrollInitTime,"ap")
            }

        }
        Text {
            width: 40
        }

        Rectangle
        {
            width: 65*2+8
            height: 57
            color: "#00029bbe"
            radius: 8
            border.color: "#ffffff"
            border.width: 0
            anchors.verticalCenter: parent.verticalCenter

            Row{
                id:buttonstabs
                //                width: parent.width
                height: 60
                spacing: 5
                Rectangle {
                    id:hardwaretabButton
                    width: 65
                    height: 57
                    color: "#029bbe"
                    radius: 8
                    border.color: "#029bbe"
                    border.width: 1
                    Text {
                        color: "#ffffff"
                        text: qsTr("AM")
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 28
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            hardwaretabButton.color = "#029bbe"
                            generaltabButton.color  ="#00029bbe"

                            hardwaretabButton.border.color="#029bbe"
                            generaltabButton.border.color  ="#ffffff"
                            timerow.timeAPm = "am"
                            dateTimeScrollId.outputTime=   hoursfeild.newValueStr +":"+minFeild.newValueStr+":"+secandsFeild.newValueStr+" "+ "am"
                            //                                            dateTimeScrollId.outputTime=   Qt.formatDateTime(timeValue,"hh") +":"+minFeild.startValue+":"+secandsFeild.startValue+" "+Qt.formatDateTime(timeValue,"AM")
                        }
                    }
                }
                Rectangle {
                    id:generaltabButton
                    width:65 //- 32
                    height: 57
                    color: "#00029bbe"
                    radius: 8
                    border.color: "#ffffff"
                    Text {
                        color: "#ffffff"
                        text: qsTr("PM")
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 28
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            generaltabButton.color="#029bbe"
                            hardwaretabButton.color="#00029bbe"

                            generaltabButton.border.color="#029bbe"
                            hardwaretabButton.border.color  ="#ffffff"
                            timerow.timeAPm="pm"
                            dateTimeScrollId.outputTime=   hoursfeild.newValueStr +":"+minFeild.newValueStr+":"+secandsFeild.newValueStr+" "+ "pm"
                            //                                            dateTimeScrollId.outputTime=   Qt.formatDateTime(outputTime,"hh") +":"+Qt.formatDateTime(outputTime,"mm")+":"+Qt.formatDateTime(outputTime,"ss")+" "+ Qt.formatDateTime(timeValue,"ap")
                            //                                            dateTimeScrollId.outputTime=   Qt.formatDateTime(outputTime,"hh") +":"+Qt.formatDateTime(outputTime,"mm")+":"+Qt.formatDateTime(outputTime,"ss")+" "+ "PM"
                        }
                    }
                }
            }
        }




    }


    function getDaysInMonth(month, year) {
        // JavaScript's Date object handles month and year calculations.
        // Passing 0 as the day will give the last day of the previous month.
        return new Date(year, month, 0).getDate();
    }


    Row{
        id: dateRow
        visible: false
        anchors.verticalCenter: parent.verticalCenter
        spacing: 9
        SpanBoxScroll{
            id:dayFeild
            width: 73
            height: 57
            color: "#00ffffff"
            radius: 4
            border.color: "#ffffff"
            minValue: 1
            //            newValue: startValue
            startValue: Qt.formatDateTime(dateTimeScrollId.scrollInitDate,"dd")
            maxValue:  getDaysInMonth(monthFeild.newValue, yearfeild.newValue) //31
            onNewValueChanged: {
                if(newValue  < 10 ){
                     newValueStr = "0"+newValue
                }else{
                    newValueStr = newValue
                }
                dateTimeScrollId.outputDate=   newValue +"/"+monthFeild.newValue+"/" +yearfeild.newValue
                //                console.log("SpanBoxScroll * 3 outputDate = ",outputDate)
            }

        }
        Text {
            height: 59
            color: "#ffffff"
            text: qsTr(":")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 40
            font.family: "Roboto Condensed"
        }
        SpanBoxScroll{
            id:monthFeild
            width: 73
            height: 57
            color: "#00ffffff"
            radius: 4
            border.color: "#ffffff"
            //            newValue: 1
            minValue: 1
            startValue: Qt.formatDateTime(dateTimeScrollId.scrollInitDate,"MM")
            //            startValue: 1
            maxValue: 12
            //            newValue: startValue
            onNewValueChanged: {
                if(newValue  < 10 ){
                     newValueStr = "0"+newValue
                }else{
                    newValueStr = newValue
                }

                dateTimeScrollId.outputDate =   dayFeild.newValueStr+"/"+newValueStr+"/" +yearfeild.newValueStr
                //                console.log("SpanBoxScroll * 3 outputDate = ",outputDate)
                dayFeild.startValue= Qt.formatDateTime(dateTimeScrollId.scrollInitDate,"dd")
            }

        }
        Text {
            height: 59
            color: "#ffffff"
            text: qsTr(":")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 40
            font.family: "Roboto Condensed"
        }
        SpanBoxScroll{
            id:yearfeild
            width: 120
            height: 57
            color: "#00ffffff"
            radius: 4
            border.color: "#ffffff"
            minValue: 2000
            //            startValue: 2023
            maxValue: 2199
            //            newValue: startValue
            startValue: Qt.formatDateTime(dateTimeScrollId.scrollInitDate,"yyyy")
            onNewValueChanged: {
                if(newValue  < 10 ){
                     newValueStr = "0"+newValue
                }else{
                    newValueStr = newValue
                }
                dateTimeScrollId.outputDate=  dayFeild.newValueStr  +"/"+monthFeild.newValueStr+"/"+newValueStr
            }

        }




    }
    states: [
        State {
            name: "dateinput"

            PropertyChanges {
                target: dateRow
                visible: true
            }

            PropertyChanges {
                target: timerow
                visible: false
            }
        },
        State {
            name: "timeinput"
        }
    ]
}
