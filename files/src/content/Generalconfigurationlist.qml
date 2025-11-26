import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Column{
    id : generalTabcontent
    spacing: 32
    width:parent.width
//    activeFocusOnTab: false

 property var avtiveAreaId//:overwritedataBaseDropbox
 property var focusAreaId


 property bool focusAreaFlage: false

//    property int  sellectedheadYpos
//     property int  sellectedHight

    Rectangle{
        color: "#00ffffff"
        border.color: "#00000000"
        anchors.fill: parent.parent
        width: generalTabcontent.width
        height: generalTabcontent.height




//======================================================


//        delet .....
//        property string kconstInputvalueBuf
//        property string currencyBoxvalueBuf  x
//        property string newDatabaseOverwriteFlag
//        property string newDistanceUnit   x
//        property string newApplicationTIMEhour
//        property string newApplicationTIMEmin
//        property string newApplicationTIMEsec
//        property string newApplicationTIMEyear
//        property string newApplicationTIMEmon
//        property string newApplicationTIMEday
//        property string newpowerOffDelay
//        property string newFarecountmode  x




    Rectangle {
        id:kconstbox
        width: (generalTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
        height: 138.04
        color: "#00029bbe"
        radius: 12
        y:32
        border.color: "#117BB1"
        border.width: 2
        Row{
            x: 22
            y: 46
            spacing: 28
            height: 47
            Image {
                source: "images/speed.png"
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: "K Constant"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        }
        Row{
            id:kconstInputvaluerow
            anchors.right: parent.right
            anchors.rightMargin: 17
            width: 397
            height: parent.height
            spacing: 2
            z:0
            TextField{
                id:kconstInputvalue
                height: parent.height
                width: 322
                color: "#ffffff"
//                text: ""
                property string oldKconstant //: value
                Connections {
                    target: appUi
    //                onValueChanged: label1test.text = Kconst
                    onSystem_Kconstant:{
                        if(kconstInputvalue.oldKconstant!==Kconst)
                        {
                        kconstInputvalue.text = Kconst
                        kconstInputvalue.oldKconstant = Kconst
                            kconstInputvalueBuf = Kconst

                        }
                    }
                }
                onTextChanged: {
                    kconstInputvalueBuf = text
                }
//                onPlaceholderTextChanged: {

//                }
                placeholderText:""


                antialiasing: true
                layer.enabled: true
                anchors.right: kconstntunt.left
                focus: false
                placeholderTextColor: "#b6b6b6"
                font.weight: Font.Medium
//                placeholderText: "1000"
                font.wordSpacing: -4.1
                font.kerning: true
                font.preferShaping: true
                anchors.verticalCenterOffset: 0
                hoverEnabled: true
                font.family: "Roboto Condensed"
                font.pointSize: 50
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                horizontalAlignment: Text.AlignRight
                activeFocusOnTab: true

                z:0
                maximumLength: 4
                onFocusReasonChanged: {
                console.log("activeFocusOnTabChanged selected")
                     console.log("focusReason  :",focusReason.toString())
                }
                                        onFocusChanged:{
                                            console.log("onFocusChanged")
                                            console.log("focusReason  :",kconstInputvalue.focusReason.toString())
                                        }





            }
            Text {
                id:kconstntunt
                text: " p/km"
                color: "#ffffff"
                focus: true
                font.weight: Font.Medium
                font.kerning: true
                font.preferShaping: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 50
                anchors.right: parent.right
            }
        }



        MouseArea{
            anchors.fill: parent
            onClicked: {

                focusAreaId = kconstInputvalue
                focusAreaFlage = !focusAreaFlage
                                if (kconstInputvalue.focus===true) {
//                                    focusAreaId = kconstInputvalue
                                    focusAreaFlage = false
                                    console.log("kconstInputvalue.focus TRUE : ",kconstInputvalue.focus)
                                } else {
                                    focusAreaFlage = true
//                                    focusAreaId = kconstInputvalue
                                     console.log("kconstInputvalue.focus FALSE : ",kconstInputvalue.focus)
                                }
            }
        }
    }





    Rectangle {
        id:farecountmodeBox
        width: (generalTabcontent.width-32)/2//width: settingscrollwindow.width * 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
        height: 138.04
        color: "transparent"
        radius: 12
        border.color: "#117BB1"
        border.width: 0
        x:0
        y:138.04+32*2
        Row{
            x: 22
            y: 46
            spacing: 28
            height: 47
            Image {
                source: "images/document.png"
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                width:(generalTabcontent.width-32)/2-330

                height: parent.height
                text: "Application Of Tarrif"
                anchors.verticalCenter: parent.verticalCenter
                font.letterSpacing: -3.3
                font.pixelSize: 40
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                font.wordSpacing: -1.1
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        }
        MydropDown{
            id:farecountmode
            anchors.fill: parent
            listTextFontsize: 52
            displayFont: "Roboto Condensed"
            listfont: "Roboto Condensed"
            buttonTextcolor: "#ffffff"
            transitionColor: "#34029bbe"
            buttonText:""
            buttonColor: "#003f33ae"
            labelfont: 52
            listTextcolor: "#ffffff"
            listColor: "#030318"
            selectedText: newFarecountmode
            height: generalTabcontent.parent.height
            listModel:["SINGLE","DOUBLE"]
            dropdownLabelX: 100
            dropdounRrectangleRadious:12
            property string oldCountMode //: value

            Connections {
                target: appUi
                onSystem_farecountmode: {
                    if(farecountmode.oldCountMode !== system_farecountmodeValue){
                        farecountmode.oldCountMode = system_farecountmodeValue
                        farecountmode.selectedText = system_farecountmodeValue
                        newFarecountmode =  system_farecountmodeValue
                    }
                }
            }

            onDropButton: {
                if(!farecountmode.listBuf.visible===true){
                    avtiveAreaId=farecountmode.listBuf
                            listDimmer.visible=true
                    farecountmodeBox.z=1
                    farecountmode.dropdounRrectangleRadious=0

                }
                else{
                             listDimmer.visible=false
                    farecountmodeBox.z=0
                    farecountmode.dropdounRrectangleRadious=12
                }
                console.log("close active area")
            }
            onSellectedfromlist: {
                listDimmer.visible = false
                farecountmodeBox.z=0
                farecountmode.dropdounRrectangleRadious=12
//                newCalculationMethod=  farecountmode.selectedText
                newFarecountmode =  farecountmode.selectedText
            }


            listBuf.onVisibleChanged: {
                console.log("listBuf.onVisibleChanged")
                    if(farecountmode.listBuf.visible===false){
                    farecountmode.dropdownbackgroundColorBuffer.height = farecountmodeBox.height
                        farecountmodeBox.z=0
                        farecountmode.dropdounRrectangleRadious=12
                        console.log("farecountmodeBox.height =",farecountmodeBox.height)
                }
            }

        }
        Image {
            x: 946
            source: "images/Path 231.png"
            anchors.rightMargin: 30
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
    }






    Rectangle {
        id:currencybuttonID
        x:parent.width/2+16
        y:32
        width: (generalTabcontent.width-32)/2//width: (settingscrollwindow.width-32)-2//width: settingscrollwindow.width * 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
        height: 138.04
        color: "transparent"
        radius: 12
        border.color: "#117BB1"
        border.width: 0
        Image {
            x: 946
            source: "images/Path 231.png"
            anchors.verticalCenterOffset: 0
            anchors.rightMargin: 56
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
        Row{
            x: 22
            y: 46
            spacing: 28
            height: 47
            Image {
                source: "images/bx-coin-stack.png"
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: "Currency"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }








        }
        MydropDown{
            id:currencyBox
            anchors.fill: parent
            listTextFontsize: 52
            displayFont: "Roboto Condensed"
            listfont: "Roboto Condensed"
            buttonTextcolor: "#ffffff"
            transitionColor: "#34029bbe"
            buttonText:""
            buttonColor: "#003f33ae"
            labelfont: 52
            listTextcolor: "#ffffff"
            listColor: "#030318"
            height: generalTabcontent.parent.height
            dropdounRrectangleRadious:12
            selectedText:currencyUnit
            listModel:["USD","AED","JOD","YAN","c1","c2","c3","c4","c5"]
            dropdownLabelX: 100
            onDropButton: {
                if(!currencyBox.listBuf.visible===true){
                    avtiveAreaId=currencyBox.listBuf
                    listDimmer.visible=true
                    currencybuttonID.z=1
                    currencyBox.dropdounRrectangleRadious=0
                }
                else{
                    listDimmer.visible=false
                    currencybuttonID.z=0
                    currencyBox.dropdounRrectangleRadious=12
                }
            }
//            Connections {
//                target: currencyBox
//                onClicked: appUi.uiSetNewKconstant(currencyBox.selectedText)
//            }
            onSellectedfromlist: {
                listDimmer.visible = false
                currencybuttonID.z=0
                currencyBox.dropdounRrectangleRadious=12
                currencyBoxvalueBuf= currencyBox.selectedText
//
//                appUi.uiSetNewcurrency(currencyBox.selectedText)
            }
            listBuf.onVisibleChanged: {
                    if(currencyBox.listBuf.visible===false){
                    currencyBox.dropdownbackgroundColorBuffer.height = currencybuttonID.height
                        currencybuttonID.z=0
                        currencyBox.dropdounRrectangleRadious=12
                }
            }
        }
    }
    Rectangle {
        id:databaseoverwriteBox
        x:parent.width/2+16
        y:138.04+32*2
//        id:dataBaseoverwriteid
        width: (generalTabcontent.width-32)/2//width: (settingscrollwindow.width-32)-2//width: settingscrollwindow.width * 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
        height: 138.04
        color: "transparent"
        radius: 12
        border.color: "#117BB1"
        border.width: 0
        Row{
            x: 22
            y: 46
            spacing: 28
            height: 47
            Image {
                source: "images/document.png"
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: "Overwrite your Database"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        }
        MydropDown{
            id:overwritedataBaseDropbox
            anchors.fill: parent
            listTextFontsize: 52
            displayFont: "Roboto Condensed"
            listfont: "Roboto Condensed"
            buttonTextcolor: "#ffffff"
            transitionColor: "#34029bbe"
            buttonText:""
            buttonColor: "#003f33ae"
            labelfont: 52
            listTextcolor: "#ffffff"
            listColor: "#030318"
            height: generalTabcontent.parent.height
            listModel:["YES","NO"]
            dropdownLabelX: 100
            dropdounRrectangleRadious:12

            property string oldoverwritedataBaseFlageValue //: value
            Connections {
                target: appUi
                onSystem_DatabaseOverwriteFlag: {
                    if(overwritedataBaseDropbox.oldoverwritedataBaseFlageValue !== DatabaseOverwriteFlagValue){
                        overwritedataBaseDropbox.oldoverwritedataBaseFlageValue = DatabaseOverwriteFlagValue
                        overwritedataBaseDropbox.selectedText = DatabaseOverwriteFlagValue
                        newDatabaseOverwriteFlag =  DatabaseOverwriteFlagValue
                    }
                }
            }


            onDropButton: {
                if(!overwritedataBaseDropbox.listBuf.visible===true){
//                    listDimmer.avtiveAreaId=overwritedataBaseDropbox
                    avtiveAreaId=overwritedataBaseDropbox.listBuf
                    listDimmer.visible=true
                    databaseoverwriteBox.z=1
                    overwritedataBaseDropbox.dropdounRrectangleRadious=0
                }
                else{
                    listDimmer.visible=false
                    databaseoverwriteBox.z=0
                    overwritedataBaseDropbox.dropdounRrectangleRadious=12
                }
            }
            onSellectedfromlist: {
                listDimmer.visible = false
                databaseoverwriteBox.z=0
                overwritedataBaseDropbox.dropdounRrectangleRadious=12
                newDatabaseOverwriteFlag = overwritedataBaseDropbox.selectedText

            }
//            onSelectionChanged: {

//            }

            listBuf.onVisibleChanged: {
                    if(overwritedataBaseDropbox.listBuf.visible===false){
                    overwritedataBaseDropbox.dropdownbackgroundColorBuffer.height = databaseoverwriteBox.height
                        databaseoverwriteBox.z=0
                        overwritedataBaseDropbox.dropdounRrectangleRadious=12
                }
            }
        }
        Image {
            source: "images/Path 231.png"
            anchors.verticalCenterOffset: 0
            anchors.rightMargin: 56
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
    }

//    Rectangle {
//        id:distanceUnitselectBox
////        x:parent.width/2+16
////        y:150
////        x: parent.width/3-32
//        anchors.horizontalCenter: parent.horizontalCenter
//        y: 138.04*2+32*3
////        id:dataBaseoverwriteid
//        width: (generalTabcontent.width-32)/3*2//width: (settingscrollwindow.width-32)-2//width: settingscrollwindow.width * 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *settingscrollwindow.width
//        height: 138.04
//        color: "transparent"
//        radius: 12
//        border.color: "#117BB1"
//        border.width: 0
//        Row{
//            x: 22
//            y: 46
//            spacing: 28
//            height: 47
//            Image {
//                source: "images/document.png"
//                fillMode: Image.PreserveAspectFit
//                anchors.verticalCenter: parent.verticalCenter
//            }
//            Text {
//                text: "Distance Unit"
//                anchors.verticalCenter: parent.verticalCenter
//                font.pixelSize: 40
//                font.family: "Roboto"
//                color: "#0fe6ef"
//            }
//        }
//        MydropDown{
//            id:distanceUnitselectDropbox
//            anchors.fill: parent
//            listTextFontsize: 52
//            listfont: "Roboto Condensed"
//            displayFont: "Roboto Condensed"
//            buttonTextcolor: "#ffffff"
//            transitionColor: "#34029bbe"
//            buttonText:""
//            buttonColor: "#003f33ae"
//            labelfont: 52
//            selectedText: distanceUnit
//            listTextcolor: "#ffffff"
//            listColor: "#030318"
//            height: generalTabcontent.parent.height
//            listModel:["Km","m","Foot", "Yards", "Miles"]
//            dropdownLabelX: 100
//            dropdounRrectangleRadious:12
//            onDropButton: {
//                if(!distanceUnitselectDropbox.listBuf.visible===true){
////                    listDimmer.avtiveAreaId=distanceUnitselectDropbox
//                    avtiveAreaId=distanceUnitselectDropbox.listBuf
//                    listDimmer.visible=true
//                    distanceUnitselectBox.z=1
//                    distanceUnitselectDropbox.dropdounRrectangleRadious=0
//                }
//                else{
//                    listDimmer.visible=false
//                    distanceUnitselectBox.z=0
//                    distanceUnitselectDropbox.dropdounRrectangleRadious=12
//                }
//            }
//            onSellectedfromlist: {
//                listDimmer.visible = false
//                distanceUnitselectBox.z=0
//                distanceUnitselectDropbox.dropdounRrectangleRadious=12
//                newDistanceUnit=distanceUnitselectDropbox.selectedText
//            }
////            onSelectionChanged: {

////            }

//            listBuf.onVisibleChanged: {
//                    if(distanceUnitselectDropbox.listBuf.visible===false){
//                    distanceUnitselectDropbox.dropdownbackgroundColorBuffer.height = distanceUnitselectBox.height
//                        distanceUnitselectBox.z=0
//                        distanceUnitselectDropbox.dropdounRrectangleRadious=12
//                }
//            }
//        }

//        Image {
//            source: "images/Path 231.png"
//            anchors.verticalCenterOffset: 0
//            anchors.rightMargin: 56
//            anchors.right: parent.right
//            anchors.verticalCenter: parent.verticalCenter
//        }
//    }






    BackgroundDimmer {
        id: listDimmer  // This will dim the background of inactive components
        height:settingscrollwindow.height
        width:settingscrollwindow.width//parent.width
        backgroundDimmercolor:"#000000"
        visible:  false
        onVisibleChanged: {//e8000818
            if(visible===true){
                backgroundDimmercolor="#e8000818"
            }else{
                backgroundDimmercolor="#000000"
            }
        }


        property var diactiveAreaId
        onInactiveareaclicked: {
            console.log("Inactive area clicked")
            if(avtiveAreaId === keypadWindow){
                keypadWindowloader.sourceComponent = null
                settingscrollwindow.width=2100
                settingscrollwindow.x=230
                customSlider.x=88
                configurationPageexitButton.x=231
                listDimmer.visible=  false
                kconstbox.z=0
                avtiveAreaId = null
            }
//            else if(avtiveAreaId===timechangebox){
//                keypadWindowloader.sourceComponent = null
//                settingscrollwindow.width=2100
//                settingscrollwindow.x=230
//                customSlider.x=88
//                configurationPageexitButton.x=231
//                avtiveAreaId=null
//                listDimmer.visible=false
//                timechangebox.z=0
//                timechangebox.areaclicked=false
//            }

            else{
                avtiveAreaId.visible=false
               listDimmer.visible=  false
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
            listDimmer.visible=  false
            focusAreaId.parent.parent.z=0
            avtiveAreaId = null
            focusAreaId.focus = false
            focusAreaId.clearFocus()
            focusAreaId = null
        } else {
            focusAreaId.focus = true
            focusAreaId.forceActiveFocus()
            keypadinputType="numbersstate"
            keypadWindowloader.sourceComponent = keypadWindow
            settingscrollwindow.width=1550
            settingscrollwindow.x=882
            customSlider.x=2461
            //kconstInputvalue.z=1
    //                    kconstInputvaluerow.z=1
            keypadWindowIDbuffer  = focusAreaId
            keypadWindowIDbuffer.placeholderText = keypadWindowIDbuffer.text
            keypadWindowIDbuffer.text=""
            configurationPageexitButton.x=882
            listDimmer.visible=  true
            focusAreaId.parent.parent.z=1
            avtiveAreaId = keypadWindow
        }
//        }


    }







}
