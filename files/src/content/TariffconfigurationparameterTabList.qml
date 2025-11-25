import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0
import "."
Column{
    id : tariffTabcontent
    spacing: 32
    width:parent.width
    property int maxLengthcounter: 0
    property var tariffkeypadWindowIDbuffer
    property string keypadinputType :"smalletter"
    property var tariffavtiveAreaId
    property var avitveChildId
    property var focusAreaId
    property var oldFocusAreaId : null

    function myValidate(minInput , maxInput , floatpointNumber, enteredValue ){
        var outputHolder
        var validatorError = 0
        if(enteredValue!==""&& parseFloat(enteredValue)>=minInput&&parseFloat(enteredValue)<=maxInput){ // if not empty to avoid init condition
            outputHolder =parseFloat(enteredValue)//.toFixed(2)
            let strFloat = parseFloat(enteredValue).toString()
            if(enteredValue[enteredValue.length - 1]=== "."&& enteredValue.indexOf(".")!==(enteredValue.length - 1)){
                 enteredValue = enteredValue.slice(0, -1); //text =text
                validatorError = 1
            }
            if(enteredValue!==strFloat&& !isNaN(strFloat) && enteredValue[enteredValue.length - 1]!== "."&& enteredValue[enteredValue.length - 1]!== "0"){
            enteredValue = parseFloat(enteredValue).toString()// text.slice(0, -1);
            }
            if(enteredValue.indexOf(".")!==-1&&enteredValue.indexOf(".")<(enteredValue.length -(floatpointNumber+1) )){//(floatpointNumber+1)  === 3
                enteredValue = enteredValue.slice(0, -1);// parseFloat(text).toFixed(2).toString()
                validatorError = 1
            }
            outputHolder=enteredValue
        }
        else{ // if out of range
            if (enteredValue.length > 0  ) {
                enteredValue = enteredValue.slice(0, -1);  // Removes the last character
            }
            validatorError = 1
            outputHolder = enteredValue
        }
        return [outputHolder,validatorError ]
    }

    onFocusAreaIdChanged: {
        keypadinputType="numbersstate"
        tariffkeypadWindowloader.sourceComponent = tariffkeypadWindow
        tariffscrollwindow.width=1550
        tariffscrollwindow.x=882
        tariffcustomSlider.x=2461
        tariffkeypadWindowIDbuffer  = focusAreaId
        tariffpageExitButton.x=882
        keyPadFlag=true
        focusAreaIdBuf=focusAreaId
        if(oldFocusAreaId===null){//focusAreaId
        }else{
            oldFocusAreaId.parent.parent.color="#00029bbe"
            if(oldFocusAreaId.text===""){
                oldFocusAreaId.text= oldFocusAreaId.previousValue
                console.log("old value text : ",oldFocusAreaId.previousValue)
            }
        }
        focusAreaId.parent.parent.color="#48029bbe"
        oldFocusAreaId = focusAreaId
    }

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

    Column{
        spacing: 32
        Row{//contaner rec inside column to avoid culomn spacing, also culomn needed because it dynamic in stack scroll view and tab
            spacing: 32
            Column{
                spacing: 32

                Text {
                    x: 22
                    color: "#ffffff"
                    text: qsTr("DAY")
                    font.pixelSize: 40
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Roboto"
                }
                Rectangle {
                    id: rectangle
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
                        x: 22
                        y: 46
                        height: 47
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        text: "Initial Hire Fee"
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id:initialhirefeetextfeild
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            background: null
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            activeFocusOnTab: false
                            z:0
                            property string previousValue
                            property string oldvalue
                            Connections {
                                target: appUi
                                onSystem_initHireFee:{
                                    if(initialhirefeetextfeild.oldvalue!==initHireFeeValue)
                                    {
                                        initialhirefeetextfeild.text = initHireFeeValue
                                        initialhirefeetextfeild.oldvalue = initHireFeeValue
                                        newinitialhirefee = initHireFeeValue
                                    }
                                }
                            }


                            onTextChanged:{
                                if(text!==""){
                                    var validateHolder = myValidate( 0.00  , 100.00 , 2, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    //                                if (validateHolder[1]===1){
                                    //                                    color = "#aa0000"
                                    //                                }else if (validateHolder[1]===0){
                                    //                                    color = "#ffffff"
                                    //                                }
                                     newinitialhirefee = text
                                }


                            }

                        }
                        Text {
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
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = initialhirefeetextfeild
                            if(focusAreaId.text!==""){
                                focusAreaId.previousValue=focusAreaId.text
                            }
                            focusAreaId.text=""
                        }
                    }
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
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
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id:initialTimeboxtextfeild
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            background: null
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            z:0
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi
                                onSystem_initTime:{
                                    if(initialTimeboxtextfeild.oldvalue!==initTimeValue)
                                    {
                                        initialTimeboxtextfeild.text = initTimeValue
                                        initialTimeboxtextfeild.oldvalue = initTimeValue
                                        newinitialTime = initTimeValue
                                    }
                                }
                            }
                            onTextChanged:{

                                if(text!==""){
                                    var validateHolder = myValidate( 0.00  , 3600.0 , -1, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newinitialTime =text
                                }

                            }
                        }
                        Text {
                            text: "sec"
                            color: "#ffffff"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize:72
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = initialTimeboxtextfeild
                            if(focusAreaId.text!==""){
                                focusAreaId.previousValue=focusAreaId.text
                            }
                            focusAreaId.text=""
                        }
                    }
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
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
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id: initialDistancetextfeild
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            z:0
                            background: null
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi
                                onSystem_InitialDistance:{
                                    if(initialDistancetextfeild.oldvalue!==InitialDistanceValue)
                                    {
                                        initialDistancetextfeild.text = InitialDistanceValue
                                        initialDistancetextfeild.oldvalue = InitialDistanceValue
                                        newinitialDistance = InitialDistanceValue
                                    }
                                }
                            }
                            onTextChanged:{
                                if(text!==""){
                                    var validateHolder = myValidate( 0.00  , 1000.0 , -1, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newinitialDistance =text
                                }
                            }
                        }
                        Text {
                            text: "m"
                            color: "#ffffff"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 78
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = initialDistancetextfeild
                            if(focusAreaId.text!==""){
                                focusAreaId.previousValue=focusAreaId.text
                            }
                            focusAreaId.text=""
                        }
                    }
                }
                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
                        x: 22
                        y: 46
                        height: 47
                        text: "Tariff Per Hour"
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id: tariffPerHtextfeild
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            z:0
                            background: null
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi
                                onSystem_tariffPerHour:{
                                    if(tariffPerHtextfeild.oldvalue!==tariffPerHourValue)
                                    {
                                        tariffPerHtextfeild.text = tariffPerHourValue
                                        tariffPerHtextfeild.oldvalue = tariffPerHourValue
                                        newtariffPerH = tariffPerHourValue
                                    }
                                }
                            }
                            onTextChanged:{
                                if(text!==""){
                                    var validateHolder = myValidate( 0.00  , 1000.00 , 2, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newtariffPerH =text
                                }
                            }
                        }
                        Text {
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
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = tariffPerHtextfeild
                            if(focusAreaId.text!==""){
                                focusAreaId.previousValue=focusAreaId.text
                            }
                            focusAreaId.text=""
                        }
                    }
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
//                        width:(tariffTabcontent.width-32)/2-380
                        x: 22
                        y: 46
                        height: parent.height
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        text: "Tariff Per Distance [km]"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: -3.3
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
//                        wrapMode: Text.WordWrap
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
                        z:0
                        TextField{
                            id: tariffPerKtextfeild
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            z:0
                            background: null
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi
                                onSystem_tariffPerDistance:{
                                    if(tariffPerKtextfeild.oldvalue!==tariffPerDistanceValue)
                                    {
                                        tariffPerKtextfeild.text = tariffPerDistanceValue
                                        tariffPerKtextfeild.oldvalue = tariffPerDistanceValue
                                        newtariffPerK = tariffPerDistanceValue
                                    }
                                }
                            }

                            onTextChanged:{
                                if(text!==""){
                                    var validateHolder = myValidate( 0.00  , 100.00 , 2, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newtariffPerK =text
                                }
                            }
                        }
                        Text {
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
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = tariffPerKtextfeild
                            if(focusAreaId.text!==""){
                                focusAreaId.previousValue=focusAreaId.text
                            }
                            focusAreaId.text=""

                        }
                    }
                }
            }
            Column{
                spacing: 32
                Text {
                    x: 22
                    color: "#ffffff"
                    text: qsTr("NIGHT")
                    font.pixelSize: 40
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Roboto"
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
                        x: 22
                        y: 46
                        height: 47
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        text: "Night Initial Hire Fee"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id:initialHireFeeTextFeild_night
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            z:0
                            background: null
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi
                                onSystem_initialhirefee_nigh:{
                                    if(initialHireFeeTextFeild_night.oldvalue!==initialhirefee_nightValue)
                                    {
                                        initialHireFeeTextFeild_night.text = initialhirefee_nightValue
                                        initialHireFeeTextFeild_night.oldvalue = initialhirefee_nightValue
                                        newinitialhirefee_night = initialhirefee_nightValue
                                    }
                                }
                            }
                            onTextChanged:{
                                if(text!==""){
                                    var validateHolder = myValidate( 0.00  , 100.00 , 2, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newinitialhirefee_night =text
                                }
                            }
                        }
                        Text {
                            text: currencyUnit
                            color: "#ffffff"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 78
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = initialHireFeeTextFeild_night
                            if(focusAreaId.text!==""){
                                focusAreaId.previousValue=focusAreaId.text
                            }
                            focusAreaId.text=""
                        }
                    }
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
                        x: 22
                        y: 46
                        height: 47
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        text: "Night Initial Time "
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id:initialTimeTextField_night
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            background: null
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            activeFocusOnTab: false
                            z:0
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi

                                // For Initial Time Night
                                onSystem_initialTime_night: {
                                    if (initialTimeTextField_night.oldvalue !== initialTime_nightValue) {
                                        initialTimeTextField_night.text = initialTime_nightValue;
                                        initialTimeTextField_night.oldvalue = initialTime_nightValue;
                                        newinitialTime_night = initialTime_nightValue;
                                    }
                                }
                            }
                            onTextChanged: {
                                if (text !== "") {
                                    var validateHolder = myValidate( 0.00  , 3600.0 ,-1, text ) //-1 === no float point
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newinitialTime_night = text;
                                }
                            }
                        }
                        Text {
                            text: "sec"//currencyUnit
                            color: "#ffffff"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = initialTimeTextField_night;
                            if (focusAreaId.text !== "") {
                                focusAreaId.previousValue = focusAreaId.text;
                            }
                            focusAreaId.text = "";
                        }
                    }
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
                        x: 22
                        y: 46
                        height: 47
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        text: "Night Initial Distance"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id:initialDistanceTextField_night
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            background: null
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            activeFocusOnTab: false
                            z:0
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi

                                onSystem_initialDistance_night: {
                                    if (initialDistanceTextField_night.oldvalue !== initialDistance_nightValue) {
                                        initialDistanceTextField_night.text = initialDistance_nightValue;
                                        initialDistanceTextField_night.oldvalue = initialDistance_nightValue;
                                        newinitialDistance_night = initialDistance_nightValue;
                                    }
                                }
                            }
                            onTextChanged: {
                                if (text !== "") {
                                    var validateHolder = myValidate( 0.00  , 1000.0 , -1, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newinitialDistance_night = text;
                                }
                            }
                        }
                        Text {
                            text: "m"//currencyUnit
                            color: "#ffffff"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = initialDistanceTextField_night;
                            if (focusAreaId.text !== "") {
                                focusAreaId.previousValue = focusAreaId.text;
                            }
                            focusAreaId.text = "";
                        }
                    }
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
                        x: 22
                        y: 46
                        height: 47
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        text: "Night Tariff Per Hour "
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id: tariffPerHTextField_night
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            text: ""
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            z:0
                            background: null
                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi

                                onSystem_tariffPerH_night: {
                                    if (tariffPerHTextField_night.oldvalue !== tariffPerH_nightValue) {
                                        tariffPerHTextField_night.text = tariffPerH_nightValue;
                                        tariffPerHTextField_night.oldvalue = tariffPerH_nightValue;
                                        newtariffPerH_night = tariffPerH_nightValue;
                                    }
                                }
                            }
                            onTextChanged: {
                                if (text !== "") {
                                    var validateHolder = myValidate( 0.00  , 1000.00 , 2, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newtariffPerH_night = text;
                                }
                            }
                        }
                        Text {
                            text: currencyUnit
                            color: "#ffffff"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 78
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = tariffPerHTextField_night;
                            if (focusAreaId.text !== "") {
                                focusAreaId.previousValue = focusAreaId.text;
                            }
                            focusAreaId.text = "";
                        }
                    }
                }

                Rectangle {
                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
                    color: "#00029bbe"
                    radius: 12
                    border.color: "#117BB1"
                    border.width: 2
                    Text {
                        x: 22
                        y: 46
                        height: 47
                        width: parent.width*0.5
                        wrapMode: Text.WordWrap
                        text: "Night Tariff Per Distance [km]"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 40
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        TextField{
                            id: tariffPerKTextField_night
                            height: parent.height
                            width: 322
                            color: "#ffffff"
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            z:0
                            background: null

                            property string previousValue
                            property string oldvalue //: value
                            Connections {
                                target: appUi

                                onSystem_tariffPerK_night: {
                                    if (tariffPerKTextField_night.oldvalue !== tariffPerK_nightValue) {
                                        tariffPerKTextField_night.text = tariffPerK_nightValue;
                                        tariffPerKTextField_night.oldvalue = tariffPerK_nightValue;
                                        newtariffPerK_night = tariffPerK_nightValue;
                                    }
                                }
                            }
                            onTextChanged: {
                                if (text !== "") {
                                    var validateHolder = myValidate( 0.00  , 100.0 , 2, text )
                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
                                    newtariffPerK_night = text;
                                }
                            }
                        }
                        Text {
                            text: currencyUnit
                            color: "#ffffff"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 78
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            focusAreaId = tariffPerKTextField_night;
                            if (focusAreaId.text !== "") {
                                focusAreaId.previousValue = focusAreaId.text;
                            }
                            focusAreaId.text = "";
                        }
                    }
                }
            }

        }
        Column{
            spacing: 32
            Row{
                spacing: 32
                width: (tariffTabcontent.width) //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                Image {
                    source: "images/add-text-line 1.png"
                }
                Text {
                    color: "#ffffff"
                    text: qsTr("SUPPLEMENTS")
                    font.pixelSize: 40
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Roboto"
                }
            }
            Row{
                spacing: 32
//                Rectangle {
//                    width: (tariffTabcontent.width-32)/2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
//                    height: 138.04
//                    color: "#00029bbe"
//                    radius: 12
//                    border.color: "#117BB1"
//                    border.width: 2
//                    Text {
//                        x: 22
//                        y: 46
//                        height: 47
//                        text: "Extra Charges"
//                        anchors.verticalCenter: parent.verticalCenter
//                        font.pixelSize: 40
//                        verticalAlignment: Text.AlignVCenter
//                        font.family: "Roboto"
//                        color: "#0fe6ef"
//                    }
//                    Row{
//                        anchors.right: parent.right
//                        anchors.rightMargin: 17
//                        width: 397
//                        height: parent.height
//                        spacing: 2
//                        z:0
//                        TextField{
//                            id: extraChargestextfeild
//                            height: parent.height
//                            width: 322
//                            color: "#ffffff"
//                            text: ""
//                            anchors.right: parent.right
//                            anchors.rightMargin: 170
//                            font.weight: Font.Medium
//                            font.wordSpacing: -4.1
//                            font.kerning: true
//                            hoverEnabled: true
//                            font.family: "Roboto Condensed"
//                            bottomPadding: 0
//                            topPadding: 0
//                            anchors.verticalCenter : parent.verticalCenter
//                            font.letterSpacing: -4
//                            font.pixelSize: 72
//                            horizontalAlignment: Text.AlignRight
//                            z:0
//                            background: null
//                            property string previousValue
//                            property string oldvalue //: value
//                            Connections {
//                                target: appUi
//                                onSystem_Extras:{
//                                    if(extraChargestextfeild.oldvalue!==extrasValue)
//                                    {
//                                        extraChargestextfeild.text = extrasValue
//                                        extraChargestextfeild.oldvalue = extrasValue
//                                        newExtraCharges = extrasValue
//                                    }
//                                }
//                            }
//                            onTextChanged:{
//                                if(text!==""){
//                                    var validateHolder = myValidate( 0.00  , 500.0 , 2, text )
//                                    text =validateHolder[0]// myValidate( 0.00  , 500.0 , 2, text )[0]
//                                    newExtraCharges =text
//                                }
//                            }
//                        }
//                        Text {
//                            text: currencyUnit
//                            color: "#ffffff"
//                            font.weight: Font.Medium
//                            font.kerning: true
//                            font.family: "Roboto Condensed"
//                            bottomPadding: 0
//                            topPadding: 0
//                            anchors.verticalCenter : parent.verticalCenter
//                            font.letterSpacing: -4
//                            font.pixelSize: 72
//                            anchors.rightMargin: 25
//                            anchors.right: parent.right
//                        }
//                    }
//                    MouseArea{
//                        anchors.fill: parent
//                        onClicked: {
//                            focusAreaId = extraChargestextfeild
//                            if(focusAreaId.text!==""){
//                                focusAreaId.previousValue=focusAreaId.text
//                            }
//                            focusAreaId.text=""
//                        }
//                    }
//                }
                Rectangle {
                    width: (tariffTabcontent.width-32)// /2 //* 0.965517241/2 - scrollView.width* 0.05// - 0.034482759 *tariffscrollwindow.width
                    height: 138.04
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
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        color: "#0fe6ef"
                    }
                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        width: 397
                        height: parent.height
                        spacing: 2
                        z:0
                        Text{
                            id: fareIncrementtextfeild
                            height: parent.height
                            width: 322
                            color: "#9b9595"
                            text: "xxx0.01"
                            anchors.right: parent.right
                            anchors.rightMargin: 170
                            font.weight: Font.Medium
                            font.wordSpacing: -4.1
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            z:0
                        }
                        Text {
                            text: currencyUnit
                            color: "#9b9595"
                            font.weight: Font.Medium
                            font.kerning: true
                            font.family: "Roboto Condensed"
                            bottomPadding: 0
                            topPadding: 0
                            anchors.verticalCenter : parent.verticalCenter
                            font.letterSpacing: -4
                            font.pixelSize: 72
                            anchors.rightMargin: 25
                            anchors.right: parent.right
                        }
                    }
                }
            }
        }
    }
}
