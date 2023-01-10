#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

<^<#Left::    MoveActiveWindowBy(-70,   0)
<^<#Right::   MoveActiveWindowBy(+70,   0)
<^<#Up::      MoveActiveWindowBy(  0, -70)
<^<#Down::    MoveActiveWindowBy(  0, +70)

<^<#Numpad0::{
    WinExist "A"
    if WinGetMinMax() {
        WinRestore
    } Else {
        WinMaximize
    }   
}
<^<#NumpadDot::{
    WinExist "A"
    WinMinimize
}

MoveActiveWindowBy(x, y) {
    WinExist "A"
    WinGetPos &current_x, &current_y
    WinMove current_x + x, current_y + y
}
