# Project Documentation

## Keyboard Component

### State Options
- `smalletter`
- `numbersstate`
- `capetalLetter`

### Structure
```javascript
Key_board {
    state: "smalletter"

    onPressedkey: {
        // When any key is pressed, the value is returned using this variable (keyboardOut) as a string.
        // Any process needed will be executed inside this function (like backspace, add new char, submit value).
    }

    onStateChanged: {
        if(state === "numbersstate") {
            // Make any action needed when state changes (number, uppercase letter, lowercase letter).
        }
    }
}
```

---

## Warning Window

### Structure
```javascript
WarningsWindow {
    row_1_string: "1"   // << set value
    row_2_string: "2"
    row_3_string: "3"
    row_4_string: "4"
    row_5_string: "5"
}
```

---

## Driver Info

### Structure
```javascript
Driver_Info {
    driverImagePath: "file://home/apDir/.../images/"  // absolute directory
    driverName: "Driver Name"
    driverIdNNumber: "12354"
}
```

---

### Notes
- Ensure proper handling of state changes in the keyboard component.
- Validate warning window strings before display.
- Driver info paths should be absolute and verified for existence.
