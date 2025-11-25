
import QtQuick 2.15
import QtQuick.Controls 2.15
import UntitledProject3 1.0

Rectangle {
    id:scrollSpan
    width: 100
    height: 100
    color: "#00ffffff"
    border.color: "#ffffff"
    property int maxValue: 31
   property int minValue: 1
    property int newValue: startValue
    property int startValue: minValue
    property string newValueStr
//    property type name: value
//    property alias newValueBuf:spanScrollList.currentIndex
//    onNewValueBufChanged: {
//        spanScrollList.currentIndex=newValueBuf

//    }






    Text {
        visible: false
        color: "#ffffff"
//        id:viewValue
        text: scrollSpan.newValue
        anchors.fill: parent
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Roboto Condensed"
    }




    Rectangle {
        color: "#00ffffff"
        border.width: 0
        anchors.fill: parent
        ScrollView {
            id:spanscrollView
            width: parent.width-15
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            clip: true
            contentItem: ListView {
                id:spanScrollList
                anchors.fill: parent
                //                currentIndex: scrollSpan.newValueBuf
                delegate: Item {
                    id: item1
                    width: 80
                    height: 44//42
//                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id:scrollShow
                        color: "#ffffff"
                        text: modelData  < 10 ? "0" + (modelData) : modelData
                        font.pixelSize: 42 // 40
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Roboto Condensed"
                    }
                }
                model: scrollSpan.maxValue+1
            }
        }
    }
     property bool enableTimerFlag: false
    Flickable {
        id: scrollArea
        anchors.fill: parent
        contentHeight: maxValue*60//(scrollShow.contentHeight)// 2000 // Tall content to enable scrolling
        clip: true
                contentY:maxValue*60//(scrollShow.contentHeight) //2000

        maximumFlickVelocity: 5 //
        //        flickDeceleration: 600 // Default is 2000, lower = slower stop
        //        maximumFlickVelocity: 500 // Default is 2500, lower = slower flick speed

        Rectangle {
            width: parent.width
            //            height: contentHeight
            color: "#eeeeee"

        }

        property int lastContentY: 0 // Track previous scroll position


        Timer {
            id: enableTimer
            triggeredOnStart: true
            running: true
            interval: 100  // 100 ms
            repeat: false  // Run only once
            onTriggered:{
                enableTimerFlag = true  // onContentYChanged  will be neglected at init (when Y changed at init with a start value)
//                console.log("enableTimerFlag = ",enableTimerFlag)
            }
        }

        onContentYChanged: {
//            if(scrollArea.enableTimerFlag===true){
            if(scrollArea.contentY>(scrollArea.contentHeight-100)){
               scrollArea.contentHeight=scrollArea.contentHeight+500
            }
//            if(scrollSpan.newValue <= scrollSpan.minValue){
//                contentY=0
//            }

//            if(scrollSpan.newValue===maxValue){
//                enableTimerFlag = true
//            }

            const scrollThreshold = 10; // Minimum difference to detect scroll direction

            if (Math.abs(scrollArea.contentY - scrollArea.lastContentY) > scrollThreshold) {
                if(enableTimerFlag===true){
                if (scrollArea.contentY < scrollArea.lastContentY) {
                    // Scrolling down
                    if (scrollSpan.newValue > scrollSpan.minValue) {
                        scrollSpan.newValue -= 1;
                    } else {
                        scrollSpan.newValue = scrollSpan.minValue;
                    }
                } else {
                    // Scrolling up
                    if (scrollSpan.newValue < scrollSpan.maxValue) {
                        scrollSpan.newValue += 1;
                    } else {
                        scrollSpan.newValue = scrollSpan.maxValue;
                    }
                }
                }

                // Sync the ListView currentIndex with the newValue
                spanScrollList.currentIndex = scrollSpan.newValue //- scrollSpan.minValue;

                // Log debug information
//                console.log("newValue = ", scrollSpan.newValue);
//                console.log(
//                            "scrollArea.contentY = ",
//                            scrollArea.contentY,
//                            "| scrollArea.lastContentY = ",
//                            scrollArea.lastContentY,
//                            "| spanScrollList.currentIndex = ",
//                            spanScrollList.currentIndex
//                            );

                // Update the last scroll position
                scrollArea.lastContentY = scrollArea.contentY;
            }
        }
//        }
        //        onContentYChanged: {
        //            if (scrollArea.contentY > scrollArea.lastContentY) {
        ////                console.log("Scrolling down");
        //                if(scrollSpan.minValue<scrollSpan.newValue){
        //                scrollSpan.newValue=scrollSpan.newValue-1
        //                }else{
        //                    scrollSpan.newValue=scrollSpan.minValue
        //                }
        //            } else  {//if (scrollArea.contentY < scrollArea.lastContentY)
        ////                console.log("Scrolling up");
        //                if(scrollSpan.maxValue>scrollSpan.newValue){
        //                scrollSpan.newValue=scrollSpan.newValue+1
        //                }else{
        //                    scrollSpan.newValue=scrollSpan.maxValue
        //                }
        //            }
        ////            scrollSpan.newValueBuf=scrollSpan.newValue
        //            spanScrollList.currentIndex=scrollSpan.newValue
        //            console.log("newValue = ", scrollSpan.newValue);
        //            console.log("scrollArea.contentY = ", scrollArea.contentY,"| scrollArea.lastContentY = ", scrollArea.lastContentY," spanScrollList.currentIndex ", spanScrollList.currentIndex);
        //            scrollArea.lastContentY = scrollArea.contentY; // Update the last scroll position


        //        }
    }
}





























//import QtQuick 2.15
//import QtQuick.Controls 2.15
//import UntitledProject3 1.0

//Rectangle {
//    id:scrollSpan
//    width: 100
//    height: 100
//    color: "#00ffffff"
//    border.color: "#ffffff"
//    property int maxValue: 31
//   property int minValue: 1
//    property int newValue: startValue
//    property int startValue: minValue
////    property type name: value
////    property alias newValueBuf:spanScrollList.currentIndex
////    onNewValueBufChanged: {
////        spanScrollList.currentIndex=newValueBuf

////    }






//    Text {
//        visible: false
//        color: "#ffffff"
////        id:viewValue
//        text: scrollSpan.newValue
//        anchors.fill: parent
//        font.pixelSize: 40
//        horizontalAlignment: Text.AlignHCenter
//        verticalAlignment: Text.AlignVCenter
//        font.family: "Roboto Condensed"
//    }




//    Rectangle {
//        color: "#00ffffff"
//        border.width: 0
//        anchors.fill: parent
//        ScrollView {
//            id:spanscrollView
//            width: parent.width-15
//            height: 50
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.horizontalCenter: parent.horizontalCenter

//            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
//            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

//            clip: true
//            contentItem: ListView {
//                id:spanScrollList
//                anchors.fill: parent
//                //                currentIndex: scrollSpan.newValueBuf
//                delegate: Item {
//                    id: item1
//                    width: 80
//                    height: 44//42
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    Text {
//                        color: "#ffffff"
//                        text: modelData  < 10 ? "0" + (modelData) : modelData
//                        font.pixelSize: 42 // 40
//                        horizontalAlignment: Text.AlignHCenter
//                        verticalAlignment: Text.AlignVCenter
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        font.family: "Roboto Condensed"
//                    }
//                }
//                model: scrollSpan.maxValue+1
//            }
//        }
//    }
//    Flickable {
//        id: scrollArea
//        anchors.fill: parent
//        contentHeight: 2000 // Tall content to enable scrolling
//        clip: true
//                contentY:2000

//        maximumFlickVelocity: 5 //
//        //        flickDeceleration: 600 // Default is 2000, lower = slower stop
//        //        maximumFlickVelocity: 500 // Default is 2500, lower = slower flick speed

//        Rectangle {
//            width: parent.width
//            //            height: contentHeight
//            color: "#eeeeee"

//        }

//        property int lastContentY: 0 // Track previous scroll position

//        onContentYChanged: {

//            if(scrollArea.contentY>(scrollArea.contentHeight-100)){
//               scrollArea.contentHeight=scrollArea.contentHeight+500
//            }
////            if(scrollSpan.newValue <= scrollSpan.minValue){
////                contentY=0
////            }

//            const scrollThreshold = 10; // Minimum difference to detect scroll direction

//            if (Math.abs(scrollArea.contentY - scrollArea.lastContentY) > scrollThreshold) {
//                if (scrollArea.contentY < scrollArea.lastContentY) {
//                    // Scrolling down
//                    if (scrollSpan.newValue > scrollSpan.minValue) {
//                        scrollSpan.newValue -= 1;
//                    } else {
//                        scrollSpan.newValue = scrollSpan.minValue;
//                    }
//                } else {
//                    // Scrolling up
//                    if (scrollSpan.newValue < scrollSpan.maxValue) {
//                        scrollSpan.newValue += 1;
//                    } else {
//                        scrollSpan.newValue = scrollSpan.maxValue;
//                    }
//                }

//                // Sync the ListView currentIndex with the newValue
//                spanScrollList.currentIndex = scrollSpan.newValue //- scrollSpan.minValue;

//                // Log debug information
//                console.log("newValue = ", scrollSpan.newValue);
//                console.log(
//                            "scrollArea.contentY = ",
//                            scrollArea.contentY,
//                            "| scrollArea.lastContentY = ",
//                            scrollArea.lastContentY,
//                            "| spanScrollList.currentIndex = ",
//                            spanScrollList.currentIndex
//                            );

//                // Update the last scroll position
//                scrollArea.lastContentY = scrollArea.contentY;
//            }
//        }
//        //        onContentYChanged: {
//        //            if (scrollArea.contentY > scrollArea.lastContentY) {
//        ////                console.log("Scrolling down");
//        //                if(scrollSpan.minValue<scrollSpan.newValue){
//        //                scrollSpan.newValue=scrollSpan.newValue-1
//        //                }else{
//        //                    scrollSpan.newValue=scrollSpan.minValue
//        //                }
//        //            } else  {//if (scrollArea.contentY < scrollArea.lastContentY)
//        ////                console.log("Scrolling up");
//        //                if(scrollSpan.maxValue>scrollSpan.newValue){
//        //                scrollSpan.newValue=scrollSpan.newValue+1
//        //                }else{
//        //                    scrollSpan.newValue=scrollSpan.maxValue
//        //                }
//        //            }
//        ////            scrollSpan.newValueBuf=scrollSpan.newValue
//        //            spanScrollList.currentIndex=scrollSpan.newValue
//        //            console.log("newValue = ", scrollSpan.newValue);
//        //            console.log("scrollArea.contentY = ", scrollArea.contentY,"| scrollArea.lastContentY = ", scrollArea.lastContentY," spanScrollList.currentIndex ", spanScrollList.currentIndex);
//        //            scrollArea.lastContentY = scrollArea.contentY; // Update the last scroll position


//        //        }
//    }
//}
