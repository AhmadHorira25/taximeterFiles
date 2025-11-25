import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Item {
    id: dropdown
    width: 200
    height: 80
    property alias selectedText: displayText.text
    signal selectionChanged(string selected)
    property string buttonText: "Default"
    property color buttonColor: "lightblue"
    property int   labelfont: 11
    property color listColor: "lightblue"
    property color listTextcolor: "lightblue"
    property color buttonTextcolor: "lightblue"
    property int  listTextFontsize: 11
    property color transitionColor : listColor
    property int  transitionTime : 300
    property int   listItemheight :61
    property color listbackGroundColor : "#b11145"
    property int listMargen :69/2
    //        property int dropdownLabelY: 50
    property int dropdownLabelX: 32
    property var listModel:["Option 1", "Option 2", "Option 3"]
    property int maxlistheight: 300
    signal dropButton()
    signal sellectedfromlist()
    property alias listBuf: listCulumn
    //        property alias listWindow: button
    property alias dropdownbackgroundColorBuffer: dropdownbackgroundColor
    property int  dropdounRrectangleRadious: 4
    property string displayFont: "Roboto"
    property string listfont: "Roboto"
    property int  totalHeight: contentColumn.height+button.height


    Rectangle {   // frame of all content , has a boarder, but intire is transpearent
        id: dropdownbackgroundColor
        border.width: 2
        radius: dropdown.dropdounRrectangleRadious
        width: parent.width
        height: parent.height
        color: "#00833f3f"
        border.color: "#117BB1"
        Rectangle {
            id: button
            width: dropdown.parent.width
            height: dropdown.parent.height//-dropdown.height*0.09
            color: "#00833f3f"
            radius: 0
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dropButton()
                    if(listCulumn.visible===true){
                        listCulumn.visible = false
                        dropdownbackgroundColor.height= button.height
                    }else{
                        listCulumn.visible = true
                        //                        dropdown.parent.z=1//list was down of under button
                        dropdownbackgroundColor.height=  contentColumn.height +button.height



                        if(contentColumn.height>=dropdown.maxlistheight){// if content more than max take max else take hegiht of content
                            dropdownbackgroundColor.height= dropdown.maxlistheight+button.height
                            dropdownscrollView.height= dropdown.maxlistheight
                            //                            dropdownList.height= dropdown.maxlistheight-1
                        }else{
                            dropdownbackgroundColor.height=  contentColumn.height+button.height
                            dropdownscrollView.height= contentColumn.height
                        }



                    }
                }
            }
            Text {
                id: displayText
                x: 117
                anchors.verticalCenter: parent.verticalCenter
                color: dropdown.buttonTextcolor
                text: dropdown.buttonText
                //                    x:dropdown.dropdownLabelX
                //                    y:dropdown.dropdownLabelY
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.family: dropdown.displayFont
                font.weight: Font.DemiBold
                anchors.rightMargin: dropdownLabelX
                anchors.right: parent.right
                font.letterSpacing: -3
                font.pixelSize: dropdown.labelfont

            }
        }

        Rectangle{ // background that not transpearant for content to make margen that not transpearent
            id :listCulumn
            //                anchors.top: button.bottom//<<?
            y:button.height-4
            width:dropdown.width-parent.border.width-1//-dropdown.listMargen*2
            visible: false
            anchors.horizontalCenter: dropdownbackgroundColor.horizontalCenter
            height:dropdownscrollView.height// contentColumn.height
            border.width: 0
            color: dropdown.listColor
            radius: parent.radius



            Column{
                width: listCulumn.width-dropdown.listMargen*2
                anchors.horizontalCenter: listCulumn.horizontalCenter



                ScrollView { // area to scroll inside
                    id:dropdownscrollView
                    width: parent.width
                    height: dropdown.maxlistheight //300
                    clip: true  // Clips content to the bounds of the ScrollView

                    Flickable { // content to be scrolled
                        id: dropdownflickableContent
                        contentWidth: parent.width
                        contentHeight: contentColumn.height  // Set to column height for vertical scroll

                        Column {
                            id: contentColumn
                            width: dropdownflickableContent.width
                            spacing: 16

                            // Dynamically create items
                            Repeater {
                                model: dropdown.listModel  // Number of items to display
                                Rectangle {
                                    width: parent.width
                                    height: dropdown.listItemheight
                                    color: dropdown.listColor//"#00833f3f"
                                    id: dropdownList
                                    Text {
                                        id:dropdownlistText
                                        //                    anchors.centerIn: parent
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pixelSize: dropdown.listTextFontsize
                                        verticalAlignment: Text.AlignVCenter
//                                        font.family: dropdown.listfontfamily
                                        font.weight: Font.DemiBold
                                         font.family: dropdown.listfont
                                        text: String(modelData)
                                        color: dropdown.listTextcolor

                                    }
                                    Behavior on color {
                                        ColorAnimation {
                                            duration: dropdown.transitionTime // Animation duration in milliseconds
                                        }
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        // Set color with animation on hover
                                        onEntered: parent.color = dropdown.transitionColor   // Highlight on hover
                                        onExited: parent.color = dropdown.listColor        // Reset color when hover ends
                                        onClicked: {
                                            displayText.text = modelData
                                            listCulumn.visible = false
                                            //                                dropdownbackgroundColor.visible=false
                                            dropdown.selectionChanged(modelData)
                                            dropdownbackgroundColor.height= button.height
                                            sellectedfromlist()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }








                //            ListView {//anchors in list view not supported
                ////                id: dropdownList
                //                width: parent.width
                //                model: dropdown.listModel
                //                height: dropdown.listItemheight*count
                ////                ScrollBar.vertical.policy: ScrollBar.AlwaysOff


                //                delegate: Rectangle {
                //                width: parent.width
                //                height: dropdown.listItemheight
                //                color: dropdown.listColor//"#00833f3f"

                ////                ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                //                Text {
                ////                    anchors.centerIn: parent
                //                    anchors.verticalCenter: parent.verticalCenter
                //                    text: modelData
                //                    font.pointSize: dropdown.listTextFontsize
                //                    color: dropdown.listTextcolor
                //                }
                //                    Behavior on color {
                //                            ColorAnimation {
                //                                duration: dropdown.transitionTime // Animation duration in milliseconds
                //                            }
                //                        }
                //                        MouseArea {
                //                            anchors.fill: parent
                //                            hoverEnabled: true
                //                            // Set color with animation on hover
                //                            onEntered: parent.color = dropdown.transitionColor   // Highlight on hover
                //                            onExited: parent.color = dropdown.listColor        // Reset color when hover ends
                //                            onClicked: {
                //                                displayText.text = modelData
                //                                listCulumn.visible = false
                ////                                dropdownbackgroundColor.visible=false
                //                                dropdown.selectionChanged(modelData)
                //                                dropdownbackgroundColor.height= button.height
                //                                sellectedfromlist()
                //                            }
                //                        }
                //                }
                //            }







            }
        }
    }
}
