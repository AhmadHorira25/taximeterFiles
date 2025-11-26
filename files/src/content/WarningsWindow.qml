import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id:warningwindow
    z:20
    width: 808
    height: warningMsgCulomn0.height // 156
    property string row_1_string : "1"
    property string row_2_string : "2"
    property string row_3_string : "3"
    property string row_4_string : "4"
    property string row_5_string : "5"
    color: "#96007d99"
    radius: 20
    border.width: 0
    Column{
        width: 704
        id:warningMsgCulomn0
        x:32
        y:20
        spacing: 15
        Row{
            spacing: 4
            Image {
                source: "images/warningsIcon.png"
            }
            Text {
                color: "#ff707a"
                text: "Warning"
                font.pixelSize: 32
                font.family: "Encode Sans"
            }
        }

        Column{
            id:warningMsgCulomn
            //                height: 115*2
            Text {
                color: "#bfffffff"
                text: row_1_string
                font.pixelSize: 24
                font.family: "Encode Sans"
                onTextChanged: {
                    if(text !== ""){
                        visible = true
                    }else{
                        visible = false
                    }
                }
            }
            Text {
                color: "#bfffffff"
                text: row_2_string
                font.pixelSize: 24
                font.family: "Encode Sans"
                onTextChanged: {
                    if(text !== ""){
                        visible = true
                    }else{
                        visible = false
                    }
                }
            }
            Text {
                color: "#bfffffff"
                text: row_3_string
                font.pixelSize: 24
                font.family: "Encode Sans"
                onTextChanged: {
                    if(text !== ""){
                        visible = true
                    }else{
                        visible = false
                    }
                }
            }
            Text {
                color: "#bfffffff"
                text: row_4_string
                font.pixelSize: 24
                font.family: "Encode Sans"
                onTextChanged: {
                    if(text !== ""){
                        visible = true
                    }else{
                        visible = false
                    }
                }
            }
            Text {
                color: "#bfffffff"
                text: row_5_string
                font.pixelSize: 24
                font.family: "Encode Sans"
                onTextChanged: {
                    if(text !== ""){
                        visible = true
                    }else{
                        visible = false
                    }
                }
            }
            Text {
                color: "#bfffffff"
                text: " "
                font.pixelSize: 24
                font.family: "Encode Sans"
                onTextChanged: {
                    if(text !== ""){
                        visible = true
                    }else{
                        visible = false
                    }
                }
            }


        }
    }
}
