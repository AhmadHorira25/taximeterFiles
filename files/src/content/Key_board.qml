import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Item {
    id: custmkeyboard
    width: 850
    height: Constants.height
    state: "smalletter" //    numbersstate  smalletter   capetalLetter






    Component{
        id:capetalletterLayout

    Column {
//        id:capetalletterLayout
        spacing: 24
        // Row for numbers
        anchors.centerIn: parent
        Row {
            anchors.horizontalCenter : parent.horizontalCenter
            spacing: 12
            KeyboardKey { width: 70.63; keyValue: "Q"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "W"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "E"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "R"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "T"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "Y"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "U"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "I"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "O"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "P"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
        }

        // Row for letters
        Row {
            spacing: 12
            anchors.horizontalCenter : parent.horizontalCenter
            KeyboardKey { width: 73.2; keyValue: "A"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "S"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "D"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "F"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "G"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "H"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "J"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "K"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "L"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
        }

        // Row for letters
        Row {
            spacing: 28
            anchors.horizontalCenter : parent.horizontalCenter
           Row{
            KeyboardKey {
                width: 86
                height: 86
                keyValue: ""
                color: "#919297"
                Image {
                    anchors.centerIn: parent
                    source: "images/upperletter.png"
                }

                onKeyPressed:custmkeyboard.state="smalletter"// pressedkey("letersize")
            }
           }

        Row{
            spacing: 12
            KeyboardKey { width: 73.2; keyValue: "Z"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "X"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "C"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "V"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "B"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "N"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "M"; height: 86.56; onKeyPressed: pressedkey(keyValue)}


        }
        Row{
         KeyboardKey {
             width: 86
             height: 86
             keyValue: ""
             color: "#919297"
             Image {
                 anchors.centerIn: parent
                 source: "images/backspace.png"
             }

             onKeyPressed: pressedkey("backspace")
         }
        }
        }
        // Row for space
        Row {
            spacing: 12
            anchors.horizontalCenter : parent.horizontalCenter

            KeyboardKey { width: 187; keyValue: "123"; height: 86.56; onKeyPressed: custmkeyboard.state="numbersstate"}
            KeyboardKey { width: 397; keyValue: "space"; height: 86.56; onKeyPressed: pressedkey(" ")}
            KeyboardKey { width: 65; keyValue: "."; height: 86.56; onKeyPressed: pressedkey(".")}
            KeyboardKey { width: 129; keyValue: "go"; height: 86.56; color: "#3478f6"; onKeyPressed: pressedkey("go")}
        }
    }
}

    Component{

        id:smalletterLayout

    Column {
//        id:smalletterLayout
        spacing: 24
        // Row for numbers
        anchors.centerIn: parent
        Row {
            anchors.horizontalCenter : parent.horizontalCenter
            spacing: 12
            KeyboardKey { width: 70.63; keyValue: "q"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "w"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "e"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "r"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "t"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "y"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "u"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "i"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "o"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 70.63; keyValue: "p"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
        }

        // Row for letters
        Row {
            spacing: 12
            anchors.horizontalCenter : parent.horizontalCenter
            KeyboardKey { width: 73.2; keyValue: "a"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "s"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "d"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "f"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "g"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "h"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "j"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "k"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "l"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
        }

        // Row for letters
        Row {
            spacing: 28
            anchors.horizontalCenter : parent.horizontalCenter
           Row{
            KeyboardKey {
                width: 86
                height: 86
                keyValue: ""
                color: "#919297"
                Image {
                    anchors.centerIn: parent
                    source: "images/upperletter.png"
                }

                onKeyPressed: custmkeyboard.state="capetalLetter"
            }
           }

        Row{
            spacing: 12
            KeyboardKey { width: 73.2; keyValue: "z"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "x"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "c"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "v"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "b"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "n"; height: 86.56; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 73.2; keyValue: "m"; height: 86.56; onKeyPressed: pressedkey(keyValue)}


        }
        Row{
         KeyboardKey {
             width: 86
             height: 86
             keyValue: ""
             color: "#919297"
             Image {
                 anchors.centerIn: parent
                 source: "images/backspace.png"
             }

             onKeyPressed: pressedkey("backspace")
         }
        }
        }
        // Row for space
        Row {
            spacing: 12
            anchors.horizontalCenter : parent.horizontalCenter

            KeyboardKey { width: 187; keyValue: "123"; height: 86.56; onKeyPressed: custmkeyboard.state="numbersstate"}
            KeyboardKey { width: 397; keyValue: "space"; height: 86.56; onKeyPressed: pressedkey(" ")}
            KeyboardKey { width: 65; keyValue: "."; height: 86.56; onKeyPressed: pressedkey(".")}
            KeyboardKey { width: 129; keyValue: "go"; height: 86.56; color: "#3478f6"; onKeyPressed: pressedkey("go")}
        }
    }

    }


    Component{
        id:numbersLayout

    Column {
//        id:smalletterLayout
        spacing: 16
        // Row for numbers
        anchors.centerIn: parent
        Row {
            anchors.horizontalCenter : parent.horizontalCenter
            spacing: 12
            KeyboardKey { width: 258.08; keyValue: "1"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 258.08; keyValue: "2"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 258.08; keyValue: "3"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
        }

        // Row for letters
        Row {
            anchors.horizontalCenter : parent.horizontalCenter
            spacing: 12
            KeyboardKey { width: 258.08; keyValue: "4"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 258.08; keyValue: "5"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 258.08; keyValue: "6"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
        }
        Row {
            anchors.horizontalCenter : parent.horizontalCenter
            spacing: 12
            KeyboardKey { width: 258.08; keyValue: "7"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 258.08; keyValue: "8"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 258.08; keyValue: "9"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
        }

        Row {
            anchors.horizontalCenter : parent.horizontalCenter
            spacing: 12
            KeyboardKey { id: keyboardKey; width: 258.08; keyValue: "."; height: 99.39; color: "#919297"; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey { width: 258.08; keyValue: "0"; height: 99.39; onKeyPressed: pressedkey(keyValue)}
            KeyboardKey {
                id: keyboardKey1;
                width: 258.08;
                keyValue: " ";
                height: 99.39;
                color: "#919297"
                onKeyPressed: pressedkey("backspace");
                Image {
                    anchors.centerIn: parent
                    source: "images/backspace.png"
                }
            }
        }

    }

    }


    Loader {
        id: loader1
        anchors.centerIn: parent
        sourceComponent: smalletterLayout
    }

    states: [
        State {
            name: "capetalLetter"
            PropertyChanges {
                           target: loader1
                           sourceComponent: capetalletterLayout
            }
        },
        State {
            name: "smalletter"
            PropertyChanges {
                           target: loader1
                           sourceComponent: smalletterLayout
            }
        },
        State {
            name: "numbersstate"//
            PropertyChanges {
                target: loader1
                sourceComponent: numbersLayout
            }
        }

//        }

    ]

    property string keyboardOut
    signal pressedkey(string key)

    onPressedkey: {
        keyboardOut=key
    }
}

