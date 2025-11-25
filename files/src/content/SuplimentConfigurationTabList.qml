import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Column{
    id : suplimentTabcontent
    spacing: 32
    width:parent.width
    property int maxLengthcounter: 0
    property var tariffkeypadWindowIDbuffer//:secandsfeild
    property string keypadinputType :"smalletter"
    property var tariffavtiveAreaId//:currencyBox5
    property var avitveChildId

    Component{
        id:tariffkeypadWindow
        Key_board {
            state:keypadinputType
            onPressedkey: {
                if(keyboardOut==="backspace"){
                    tariffkeypadWindowIDbuffer.text = tariffkeypadWindowIDbuffer.text.slice(0, -1);
                }else if(keyboardOut==="go"){
                    tariffkeypadWindowloader.sourceComponent = null
                    tariffscrollwindow.width=2100
                    tariffscrollwindow.x=230
                    tariffcustomSlider.x=88
                    tariffpageExitButton.x=231
                }else{
                if(tariffkeypadWindowIDbuffer.text.length<1){
                    tariffkeypadWindowIDbuffer.text.length=30
                }
                if(tariffkeypadWindowIDbuffer.maximumLength>tariffkeypadWindowIDbuffer.text.length){
                    tariffkeypadWindowIDbuffer.text=tariffkeypadWindowIDbuffer.text+keyboardOut
                    maxLengthcounter=maxLengthcounter+1
                }
                }
            }
        }
    }

    Rectangle{//contaner rec inside column to avoid culomn spacing, also culomn needed because it dynamic in stack scroll view and tab
        color: "#00ffffff"
        border.color: "#00000000"
        anchors.fill: parent.parent
        width: suplimentTabcontent.width
        height: suplimentTabcontent.height
//======================================================




    Rectangle {
//        id:initialhirefeebox
        width: (suplimentTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
        height: 138.04
        color: "#00029bbe"
        radius: 12
        border.color: "#117BB1"
        border.width: 2
            Text {
                x: 22
                y: 46
                 height: 47
                text: "Initial Hire Fee"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        Row{
            anchors.right: parent.right
            anchors.rightMargin: 17
            width: 397
            height: parent.height
            spacing: 2
            z:1
            TextField{
                id:initialhirefeetextfeild
                height: parent.height
                width: 322
                color: "#ffffff"
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 170
                placeholderTextColor: "#aaaaaa"
                font.weight: Font.Medium
                placeholderText: "1000"
                font.wordSpacing: -4.1
                font.kerning: true
                hoverEnabled: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                horizontalAlignment: Text.AlignRight
                z:0
                maximumLength: 4
                onTextChanged:{
                    newinitialhirefee =text
                }
            }
            Text {
//                id:initialhirefeetext
                text: currencyUnit
                color: "#ffffff"
                font.weight: Font.Medium
                font.kerning: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                anchors.right: parent.right
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(tariffkeypadWindowloader.sourceComponent === tariffkeypadWindow){
                    tariffkeypadWindowloader.sourceComponent = null
                    tariffscrollwindow.width=2100
                    tariffscrollwindow.x=230
                    tariffcustomSlider.x=88
                    tariffpageExitButton.x=231
                    suplimentListDimmer.visible=  false
                    avitveChildId.z=0
                    suplimentTabcontent.avitveChildId=null
//                    tariffavtiveAreaId = null
                }else{
                    keypadinputType="numbersstate"
                    tariffkeypadWindowloader.sourceComponent = tariffkeypadWindow //load keyboard
//                   resize scroll area (width) ,and shifting start point
                    tariffscrollwindow.width=1550
                    tariffscrollwindow.x=882
                    tariffcustomSlider.x=2461
//                    initialhirefeetextfeild.z=1
//                    initialhirefeeboxrow.z=1
                    tariffkeypadWindowIDbuffer  = initialhirefeetextfeild // pass element of id to keyboard string var
                    tariffkeypadWindowIDbuffer.placeholderText = tariffkeypadWindowIDbuffer.text
                    tariffkeypadWindowIDbuffer.text=""//clear buffer to store new value of string from keyboard
                    tariffpageExitButton.x=882 // shift exit button when keyboard opened
                    suplimentListDimmer.visible=  true // show shadow on top of other components area
                    suplimentListDimmer.z=0 // make shadow in back and active area in front
//                    tariffavtiveAreaId =initialhirefeebox
                    suplimentTabcontent.avitveChildId=parent// initialhirefeebox//set id of active box to shadowing other
                    suplimentTabcontent.avitveChildId.z=1//set active area in fron of shadow
                }
            }
        }
    }






    Rectangle {
//        id:initialTimebox
        width: (suplimentTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
        height: 138.04
        y:150
        color: "#00029bbe"
        radius: 12
        border.color: "#117BB1"
        border.width: 2
            Text {
                x: 22
                y: 46
                 height: 47
                text: "Initial Time"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        Row{
            anchors.right: parent.right
            anchors.rightMargin: 17
            width: 397
            height: parent.height
            spacing: 2
            z:1
            TextField{
                id:initialTimeboxtextfeild
                height: parent.height
                width: 322
                color: "#ffffff"
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 170
                placeholderTextColor: "#aaaaaa"
                font.weight: Font.Medium
                placeholderText: "1000"
                font.wordSpacing: -4.1
                font.kerning: true
                hoverEnabled: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                horizontalAlignment: Text.AlignRight
                z:0
                maximumLength: 4
                onTextChanged:{
                    newinitialTime =text
                }
            }
            Text {
//                id:initialTimetext
                text: "HR"
                color: "#ffffff"
                font.weight: Font.Medium
                font.kerning: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize:72
                anchors.right: parent.right
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(tariffkeypadWindowloader.sourceComponent === tariffkeypadWindow){
                    tariffkeypadWindowloader.sourceComponent = null
                    tariffscrollwindow.width=2100
                    tariffscrollwindow.x=230
                    tariffcustomSlider.x=88
                    tariffpageExitButton.x=231
                    suplimentListDimmer.visible=  false
                    suplimentTabcontent.avitveChildId.z=0
                    suplimentTabcontent.avitveChildId=null
//                    tariffavtiveAreaId = null
                }else{
                    keypadinputType="numbersstate"
                    tariffkeypadWindowloader.sourceComponent = tariffkeypadWindow //load keyboard
//                   resize scroll area (width) ,and shifting start point
                    tariffscrollwindow.width=1550
                    tariffscrollwindow.x=882
                    tariffcustomSlider.x=2461
//                    initialhirefeetextfeild.z=1
//                    initialhirefeeboxrow.z=1
                    tariffkeypadWindowIDbuffer  = initialTimeboxtextfeild // pass element of id to keyboard string var
                    tariffkeypadWindowIDbuffer.placeholderText = tariffkeypadWindowIDbuffer.text
                    tariffkeypadWindowIDbuffer.text=""//clear buffer to store new value of string from keyboard
                    tariffpageExitButton.x=882 // shift exit button when keyboard opened
                    suplimentListDimmer.visible=  true // show shadow on top of other components area
                    suplimentListDimmer.z=0 // make shadow in back and active area in front
//                    tariffavtiveAreaId =initialhirefeebox
                    suplimentTabcontent.avitveChildId=parent// initialhirefeebox//set id of active box to shadowing other
                    suplimentTabcontent.avitveChildId.z=1//set active area in fron of shadow
                }
            }
        }
    }






    Rectangle {
//        id:initialTimebox
        width: (suplimentTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
        height: 138.04
        x:(suplimentTabcontent.width)/2+16
        color: "#00029bbe"
        radius: 12
        border.color: "#117BB1"
        border.width: 2

            Text {
                width:(suplimentTabcontent.width-32)/2-380
                x: 22
                y: 46
                height: parent.height
                text: "Tariff Per Distance [KM]"
                anchors.verticalCenter: parent.verticalCenter
                font.letterSpacing: -3.3
                font.pixelSize: 40
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                font.wordSpacing: -1.1
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        Row{
            anchors.right: parent.right
            anchors.rightMargin: 17
            width: 397
            height: parent.height
            spacing: 2
            z:1
            TextField{
                id: tariffPerKtextfeild
                height: parent.height
                width: 322
                color: "#ffffff"
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 170
                placeholderTextColor: "#aaaaaa"
                font.weight: Font.Medium
                placeholderText: "1000"
                font.wordSpacing: -4.1
                font.kerning: true
                hoverEnabled: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                horizontalAlignment: Text.AlignRight
                z:0
                maximumLength: 4
                onTextChanged:{
                    newtariffPerK =text
                }
            }
            Text {
//                id:initialTimetext
                text: currencyUnit
                color: "#ffffff"
                font.weight: Font.Medium
                font.kerning: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                anchors.right: parent.right
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(tariffkeypadWindowloader.sourceComponent === tariffkeypadWindow){
                    tariffkeypadWindowloader.sourceComponent = null
                    tariffscrollwindow.width=2100
                    tariffscrollwindow.x=230
                    tariffcustomSlider.x=88
                    tariffpageExitButton.x=231
                    suplimentListDimmer.visible=  false
                    suplimentTabcontent.avitveChildId.z=0
                    suplimentTabcontent.avitveChildId=null
//                    tariffavtiveAreaId = null
                }else{
                    keypadinputType="numbersstate"
                    tariffkeypadWindowloader.sourceComponent = tariffkeypadWindow //load keyboard
//                   resize scroll area (width) ,and shifting start point
                    tariffscrollwindow.width=1550
                    tariffscrollwindow.x=882
                    tariffcustomSlider.x=2461
//                    initialhirefeetextfeild.z=1
//                    initialhirefeeboxrow.z=1
                    tariffkeypadWindowIDbuffer  = tariffPerKtextfeild // pass element of id to keyboard string var
                    tariffkeypadWindowIDbuffer.placeholderText = tariffkeypadWindowIDbuffer.text
                    tariffkeypadWindowIDbuffer.text=""//clear buffer to store new value of string from keyboard
                    tariffpageExitButton.x=882 // shift exit button when keyboard opened
                    suplimentListDimmer.visible=  true // show shadow on top of other components area
                    suplimentListDimmer.z=0 // make shadow in back and active area in front
//                    tariffavtiveAreaId =initialhirefeebox
                    suplimentTabcontent.avitveChildId=parent// initialhirefeebox//set id of active box to shadowing other
                    suplimentTabcontent.avitveChildId.z=1//set active area in fron of shadow
                }
            }
        }
    }





    Rectangle {
//        id:initialTimebox
        width: (suplimentTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
        height: 138.04
        x:(suplimentTabcontent.width)/2+16
        y:150
        color: "#00029bbe"
        radius: 12
        border.color: "#117BB1"
        border.width: 2
            Text {
                x: 22
                y: 46
                 height: 47
                text: "Tariff Per Hour"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        Row{
            anchors.right: parent.right
            anchors.rightMargin: 17
            width: 397
            height: parent.height
            spacing: 2
            z:1
            TextField{
                id: tariffPerHtextfeild
                height: parent.height
                width: 322
                color: "#ffffff"
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 170
                placeholderTextColor: "#aaaaaa"
                font.weight: Font.Medium
                placeholderText: "1000"
                font.wordSpacing: -4.1
                font.kerning: true
                hoverEnabled: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                horizontalAlignment: Text.AlignRight
                z:0
                maximumLength: 4
                onTextChanged:{
                    newtariffPerH =text
                }
            }
            Text {
//                id:initialTimetext
                text: currencyUnit
                color: "#ffffff"
                font.weight: Font.Medium
                font.kerning: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                anchors.right: parent.right
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(tariffkeypadWindowloader.sourceComponent === tariffkeypadWindow){
                    tariffkeypadWindowloader.sourceComponent = null
                    tariffscrollwindow.width=2100
                    tariffscrollwindow.x=230
                    tariffcustomSlider.x=88
                    tariffpageExitButton.x=231
                    suplimentListDimmer.visible=  false
                    suplimentTabcontent.avitveChildId.z=0
                    suplimentTabcontent.avitveChildId=null
//                    tariffavtiveAreaId = null
                }else{
                    keypadinputType="numbersstate"
                    tariffkeypadWindowloader.sourceComponent = tariffkeypadWindow //load keyboard
//                   resize scroll area (width) ,and shifting start point
                    tariffscrollwindow.width=1550
                    tariffscrollwindow.x=882
                    tariffcustomSlider.x=2461
//                    initialhirefeetextfeild.z=1
//                    initialhirefeeboxrow.z=1
                    tariffkeypadWindowIDbuffer  = tariffPerHtextfeild // pass element of id to keyboard string var
                    tariffkeypadWindowIDbuffer.placeholderText = tariffkeypadWindowIDbuffer.text
                    tariffkeypadWindowIDbuffer.text=""//clear buffer to store new value of string from keyboard
                    tariffpageExitButton.x=882 // shift exit button when keyboard opened
                    suplimentListDimmer.visible=  true // show shadow on top of other components area
                    suplimentListDimmer.z=0 // make shadow in back and active area in front
//                    tariffavtiveAreaId =initialhirefeebox
                    suplimentTabcontent.avitveChildId=parent// initialhirefeebox//set id of active box to shadowing other
                    suplimentTabcontent.avitveChildId.z=1//set active area in fron of shadow
                }
            }
        }
    }



    Rectangle {
//        id:initialTimebox
        width: (suplimentTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
        height: 138.04
        x:0//(suplimentTabcontent.width)/2+16
        y:300
        color: "#00029bbe"
        radius: 12
        border.color: "#117BB1"
        border.width: 2
            Text {
                x: 22
                y: 46
                 height: 47
                text: "Initial Distance"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        Row{
            anchors.right: parent.right
            anchors.rightMargin: 17
            width: 397
            height: parent.height
            spacing: 2
            z:1
            TextField{
                id: initialDistancetextfeild
                height: parent.height
                width: 322
                color: "#ffffff"
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 170
                placeholderTextColor: "#aaaaaa"
                font.weight: Font.Medium
                placeholderText: "1000"
                font.wordSpacing: -4.1
                font.kerning: true
                hoverEnabled: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                horizontalAlignment: Text.AlignRight
                z:0
                maximumLength: 4
                onTextChanged:{
                    newinitialDistance =text
                }
            }
            Text {
//                id:initialTimetext
                text: distanceUnit
                color: "#ffffff"
                font.weight: Font.Medium
                font.kerning: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 78
                anchors.right: parent.right
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(tariffkeypadWindowloader.sourceComponent === tariffkeypadWindow){
                    tariffkeypadWindowloader.sourceComponent = null
                    tariffscrollwindow.width=2100
                    tariffscrollwindow.x=230
                    tariffcustomSlider.x=88
                    tariffpageExitButton.x=231
                    suplimentListDimmer.visible=  false
                    suplimentTabcontent.avitveChildId.z=0
                    suplimentTabcontent.avitveChildId=null
//                    tariffavtiveAreaId = null
                }else{
                    keypadinputType="numbersstate"
                    tariffkeypadWindowloader.sourceComponent = tariffkeypadWindow //load keyboard
//                   resize scroll area (width) ,and shifting start point
                    tariffscrollwindow.width=1550
                    tariffscrollwindow.x=882
                    tariffcustomSlider.x=2461
//                    initialhirefeetextfeild.z=1
//                    initialhirefeeboxrow.z=1
                    tariffkeypadWindowIDbuffer  = initialDistancetextfeild // pass element of id to keyboard string var
                    tariffkeypadWindowIDbuffer.placeholderText = tariffkeypadWindowIDbuffer.text
                    tariffkeypadWindowIDbuffer.text=""//clear buffer to store new value of string from keyboard
                    tariffpageExitButton.x=882 // shift exit button when keyboard opened
                    suplimentListDimmer.visible=  true // show shadow on top of other components area
                    suplimentListDimmer.z=0 // make shadow in back and active area in front
//                    tariffavtiveAreaId =initialhirefeebox
                    suplimentTabcontent.avitveChildId=parent// initialhirefeebox//set id of active box to shadowing other
                    suplimentTabcontent.avitveChildId.z=1//set active area in fron of shadow
                }
            }
        }
    }







    Rectangle {
//        id:initialTimebox
        width: (suplimentTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
        height: 138.04
        x:(suplimentTabcontent.width)/2+16
        y:300
        color: "#00029bbe"
        radius: 12
        border.color: "#117BB1"
        border.width: 2
            Text {
                x: 22
                y: 46
                 height: 47
                text: "Fare Increment"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                font.family: "Roboto"
                color: "#0fe6ef"
            }
        Row{
            anchors.right: parent.right
            anchors.rightMargin: 17
            width: 397
            height: parent.height
            spacing: 2
            z:1
            TextField{
                id: fareIncrementtextfeild
                height: parent.height
                width: 322
                color: "#ffffff"
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 170
                placeholderTextColor: "#aaaaaa"
                font.weight: Font.Medium
                placeholderText: "1000"
                font.wordSpacing: -4.1
                font.kerning: true
                hoverEnabled: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                horizontalAlignment: Text.AlignRight
                z:0
                maximumLength: 4
                onTextChanged:{
                    newfareIncrement =text
                }
            }
            Text {
//                id:initialTimetext
                text: currencyUnit
                color: "#ffffff"
                font.weight: Font.Medium
                font.kerning: true
                font.family: "Roboto Condensed"
                bottomPadding: 0
                topPadding: 0
                anchors.verticalCenter : parent.verticalCenter
                font.letterSpacing: -4
                font.pixelSize: 72
                anchors.right: parent.right
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(tariffkeypadWindowloader.sourceComponent === tariffkeypadWindow){
                    tariffkeypadWindowloader.sourceComponent = null
                    tariffscrollwindow.width=2100
                    tariffscrollwindow.x=230
                    tariffcustomSlider.x=88
                    tariffpageExitButton.x=231
                    suplimentListDimmer.visible=  false
                    suplimentTabcontent.avitveChildId.z=0
                    suplimentTabcontent.avitveChildId=null
//                    tariffavtiveAreaId = null
                }else{
                    keypadinputType="numbersstate"
                    tariffkeypadWindowloader.sourceComponent = tariffkeypadWindow //load keyboard
//                   resize scroll area (width) ,and shifting start point
                    tariffscrollwindow.width=1550
                    tariffscrollwindow.x=882
                    tariffcustomSlider.x=2461
//                    initialhirefeetextfeild.z=1
//                    initialhirefeeboxrow.z=1
                    tariffkeypadWindowIDbuffer  = fareIncrementtextfeild // pass element of id to keyboard string var
                    tariffkeypadWindowIDbuffer.placeholderText = tariffkeypadWindowIDbuffer.text
                    tariffkeypadWindowIDbuffer.text=""//clear buffer to store new value of string from keyboard
                    tariffpageExitButton.x=882 // shift exit button when keyboard opened
                    suplimentListDimmer.visible=  true // show shadow on top of other components area
                    suplimentListDimmer.z=0 // make shadow in back and active area in front
//                    tariffavtiveAreaId =initialhirefeebox
                    suplimentTabcontent.avitveChildId=parent// initialhirefeebox//set id of active box to shadowing other
                    suplimentTabcontent.avitveChildId.z=1//set active area in fron of shadow
                }
            }
        }
    }












    BackgroundDimmer {
        id: suplimentListDimmer  // This will dim the background of inactive components
        height:tariffscrollwindow.height
        width:tariffscrollwindow.width//parent.width
        backgroundDimmercolor:"#000000"
        visible:  false
        onVisibleChanged: {//e8000818
            if(visible===true){
                backgroundDimmercolor="#e8000818"
            }else{
                backgroundDimmercolor="#000000"
            }
        }

//        property var diactiveAreaId
        onInactiveareaclicked: {
//            console.log("Inactive area clicked")
//            if(tariffavtiveAreaId === initialhirefeebox){// tariffkeypadWindow){
                tariffkeypadWindowloader.sourceComponent = null
                tariffscrollwindow.width=2100
                tariffscrollwindow.x=230
                tariffcustomSlider.x=88
                tariffpageExitButton.x=231
                suplimentListDimmer.visible=  false
                suplimentTabcontent.avitveChildId.z=0
//                tariffavtiveAreaId = null
//            }
//            else{
////                tariffavtiveAreaId.visible=false
//               suplimentListDimmer.visible=  false
//            }
        }
    }
}
}
