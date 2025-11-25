import QtQuick 2.15
import QtQuick.Controls 2.15
//import "."

Item {
    id: loginPage
    width: 2560
    height: 720
    property string userName: "" //"admin"
    property string passWord: ""//"admin"
    property string loginTargetPage : "Mainconsol.qml"
    property bool gotoMainVisible: false
    property bool keyPadFlag: false
    property var focusAreaIdBuf
    property var focusAreaId
    property var oldFocusAreaId : null
    property string keypadinputType: "smalletter"
    property int maxLengthcounter: 0

    onFocusAreaIdChanged: {
        keypadinputType="smalletter"
        //        logginkeypadWindowloader.sourceComponent = logginkeypadWindow
        id:logginkeypadWindow.visible=true
        focusAreaIdBuf  = focusAreaId
        if(oldFocusAreaId!==null){
            oldFocusAreaId.parent.color="#cdffffff"
        }
        oldFocusAreaId=focusAreaId
        focusAreaId.parent.color="#cdEEEEEE"
        keyPadFlag=true
        loginFeild.x= 937
    }
    //Rectangle{
    //    z:19
    //    width: logginkeypadWindow.width
    //    height: 1000
    //    radius: 200
    //    anchors.verticalCenter: parent.verticalCenter
    //    visible: logginkeypadWindow.visible
    //    id:keyBoardBackGround
    //    gradient: Gradient {
    //        GradientStop {
    //            position: 0
    //            color: "#5200198F"
    //        }
    //        GradientStop {
    //            position: 1
    //            color: "#ffffff"
    //        }
    //        orientation: Gradient.Horizontal
    ////        orientation: Gradient.Vertical
    //    }
    //}

    Rectangle{
        z:19
        width: logginkeypadWindow.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        visible: logginkeypadWindow.visible
        id:keyBoardBackGround
        color: "#EEEEEE"

        //    gradient: Gradient {
        //        GradientStop {
        //            position: 0
        //            color: "#DDDDDD"
        //        }
        //        GradientStop {
        //            position: 1
        //            color: "#EEEEEE"
        //        }
        //        orientation: Gradient.Horizontal
        ////        orientation: Gradient.Vertical
        //    }
    }

    Key_board {
        z:20
        state:keypadinputType
        id:logginkeypadWindow
        visible: false
        onPressedkey: {
            if(keyboardOut==="backspace"){
                focusAreaIdBuf.text = focusAreaIdBuf.text.slice(0, -1);
            }else if(keyboardOut==="go"){
                //                logginkeypadWindowloader.sourceComponent = null
                focusAreaId.parent.color="#cdffffff"
                oldFocusAreaId=null
                focusAreaId=null
                visible=false
                loginFeild.x= 860
            }else{
                focusAreaIdBuf.text=focusAreaIdBuf.text+keyboardOut
            }
        }
        onStateChanged: {
            if(state==="numbersstate"){
                backToChar.visible=true
            }else{
                backToChar.visible=false
            }
        }
        KeyboardKey { id:backToChar; x: 20; y: 588; width: 150; keyValue: "ABC"; height: 86.56; visible: false; onKeyPressed:{ logginkeypadWindow.state="smalletter"}}
    }

    Rectangle{
        color: "#ffffff"
        border.color: "#ffffff"
        border.width: 0
        anchors.fill: parent
        clip: true
        Rectangle{
            x: -632
            y: -1
            width: 1300
            height: width
            color: "#00198F"
            radius: width/2
            border.width: 0
            rotation: 49.007
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffffff"
                }
                GradientStop {
                    position: 1
                    color: "#5200198F"
                }
                orientation: Gradient.Vertical
            }
        }
        Rectangle {
            x: 1947
            y: -462
            width: 1300
            height: width
            color: "#00198f"
            radius: width/2
            border.width: 0
            gradient: Gradient {
                orientation: Gradient.Vertical
                GradientStop {
                    position: 0
                    color: "#ffffff"
                }

                GradientStop {
                    position: 1
                    color: "#5200198f"
                }
            }
            rotation: -105.322
        }
    }
    Column{
        id:loginFeild
        x: 860
        y: 174
        spacing: 32
        Rectangle {
            id: usernameInputfeild
            width: 838
            height: 114
            color: "#cdffffff"
            Text {
                id: usernameInput
                width: parent.width-120
                color: "#050825"
                text: "USER NAME"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 20
                font.family: "Encode Sans"
                onTextChanged: {
                    if(text===""){
                        usernameInputHold.visible=true
                    }else{
                        usernameInputHold.visible=false
                    }
                }
                Text{
                    id: usernameInputHold
                    color: "#cf050825"
                    text: "USER NAME"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Encode Sans"
                }
            }
            Image {
                x: 751
                y: 30
                source: "images/usernameIcon.png"
            }
            MouseArea{
                anchors.fill: parent
                //                z:3
                onClicked: {
                    focusAreaId=usernameInput
                    focusAreaId.text=""
                }
            }
            Rectangle{
                width: parent.width
                height: 3
                color: "#000000"
                anchors.bottom: parent.bottom
            }
        }

        Rectangle {
            id: passwardInputfeild
            width: 838
            height: 114
            color: "#cdffffff"
            Text {
                id: passwardInput
                width: parent.width-120
                visible: false
                color: "#050825"
                text: "PASSWORD"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 20
                font.family: "Encode Sans"
                property string passwardInputHidden: ""
                onTextChanged: {
                    if(text===""){
                        passwardInputHold.visible=true
                        passwardInputHidden.text=""
                    }else{
                        passwardInputHold.visible=false
                        passwardInputHidden.visible=true
                        passwardInputHidden.text = ""
                        for (var i = 0; i < passwardInput.text.length; i++) {
                            passwardInputHidden.text = passwardInputHidden.text + '●' // '⬤'
                        }
                    }
                }
            }
            Text{
                id: passwardInputHidden
                color: "#cf050825"
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 28
                anchors.leftMargin: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Encode Sans"
            }
            Text{
                id: passwardInputHold
                color: "#cf050825"
                text: "PASSWORD"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 28
                anchors.leftMargin: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Encode Sans"
            }
            Image {
                x: 751
                y: 30
                source: "images/passwordIcon.png"
            }
            MouseArea{
                anchors.fill: parent
                //                z:3
                onClicked: {
                    focusAreaId=passwardInput
                    focusAreaId.text=""
                }
            }
            Rectangle{
                width: parent.width
                height: 3
                color: "#000000"
                anchors.bottom: parent.bottom
            }
        }
        Row{
            spacing: 16
            Rectangle {
                width: 838/3-8
                height: 98
                color: "#029bbe" // Make the frame background transparent
                border.color: "#029BBE"
                border.width: 2
                radius: 1
                Text {
                    color: "#ffffff"
                    font.family: "Encode Sans" // Make the button fill the frame
                    text: "BACK"
                    anchors.fill: parent
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        pageLoader.source = "Mainconsol.qml"
                    }
                    onPressed: {
                        parent.border.color = "#f5f5f5"
                    }
                    onReleased: {
                        parent.border.color= "#029BBE"
                    }
                }
            }
            Rectangle {
                width: 838/3*2-8
                height: 98
                color: "#029bbe" // Make the frame background transparent
                border.color: "#029BBE"
                border.width: 2
                radius: 1
                Text {
                    color: "#ffffff"
                    font.family: "Encode Sans" // Make the button fill the frame
                    text: "LOGIN"
                    anchors.fill: parent
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(loginPage.userName===passwardInput.text&&loginPage.passWord===usernameInput.text){
                            pageLoader.source = loginPage.loginTargetPage//  "Mainconsol.qml"
                        }
                    }
                    onPressed: {
                        parent.border.color = "#f5f5f5"
                    }
                    onReleased: {
                        parent.border.color= "#029BBE"
                    }
                }
            }
        }
    }
}
