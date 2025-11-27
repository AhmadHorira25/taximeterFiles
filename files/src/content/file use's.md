Key_board :

state: "smalletter" //    "numbersstate"  "smalletter"   "capetalLetter"
    Key_board {
        state:"smalletter"
        onPressedkey: {  
        // when any key pressed value returned using this var  (keyboardOut) as a string , and any prcess needed will excuted inside this function (like back space, add new char, subbmit value)
        }
        onStateChanged: {
           if(state==="numbersstate"){ // make any action needed when state changed (number, upperlater, lower latter)
            }
        }
   }





wairning window :   
    WarningsWindow{
        row_1_string : "1"  // <<  set value
        row_2_string : "2"
        row_3_string : "3"
        row_4_string : "4"
        row_5_string : "5"
    }


