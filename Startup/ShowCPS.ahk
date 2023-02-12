#Requires AutoHotkey v2.0
#SingleInstance Force

leftClickCount0 := 0
leftClickCount1 := 0
leftClickCount2 := 0
leftClickCount3 := 0
leftClickCount4 := 0
leftClickCount5 := 0
leftClickCount6 := 0
leftClickCount7 := 0
leftClickCount8 := 0
leftClickCount9 := 0
leftClickCountSum := 0
rightClickCount0 := 0
rightClickCount1 := 0
rightClickCount2 := 0
rightClickCount3 := 0
rightClickCount4 := 0
rightClickCount5 := 0
rightClickCount6 := 0
rightClickCount7 := 0
rightClickCount8 := 0
rightClickCount9 := 0
rightClickCountSum := 0
dragging := 0
winPosX := 1752
winPosY := 530
mousePosOriginalX := 0
mousePosOriginalY := 0
mousePosOriginalX2 := 0
mousePosOriginalY2 := 0
winPosFinalX := 1752
winPosFinalY := 530
ConstantlyMoveToTop := 1

myGui := Gui()

PID := WinGetPID(myGui)
myGui.Opt("+AlwaysOnTop -Caption +ToolWindow")
WinSetTransparent("192", MyGui)
myPic := myGui.Add("Picture", "x0 y0 w132 h76", "HBITMAP:*" LoadPicture("../StartupImages/ShowCPS.png"))
myGui.SetFont("s47", "System")
leftUpText := myGui.Add("Text", "x0 y-5 w66 Center cWhite BackgroundTrans", "  ")
rightUpText := myGui.Add("Text", "x66 y-5 w66 Center cWhite BackgroundTrans", "  ")
myGui.SetFont("s20", "System")
leftDownText := myGui.Add("Text", "x0 y48 w66 Center cWhite BackgroundTrans", "  ")
rightDownText := myGui.Add("Text", "x66 y48 w66 Center cWhite BackgroundTrans", "  ")
myGui.Show("X1752 Y530 W132 H76 NoActivate")

CoordMode("Mouse", "Screen")

SetTimer(LeftUpdate, 100)
SetTimer(RightUpdate, 100)
SetTimer(MoveWindowToTop, 100)
SetTimer(DragGui, 100)
LeftUpdate(*) {
    global leftClickCount0, leftClickCount1, leftClickCount2, leftClickCount3, leftClickCount4, leftClickCount5, leftClickCount6, leftClickCount7, leftClickCount8, leftClickCount9

    leftUpText.Value := leftClickCount0 + leftClickCount1 + leftClickCount2 + leftClickCount3 + leftClickCount4 + leftClickCount5 + leftClickCount6 + leftClickCount7 + leftClickCount8 + leftClickCount9
    leftDownText.Value := leftClickCountSum
    leftClickCount9 := leftClickCount8
    leftClickCount8 := leftClickCount7
    leftClickCount7 := leftClickCount6
    leftClickCount6 := leftClickCount5
    leftClickCount5 := leftClickCount4
    leftClickCount4 := leftClickCount3
    leftClickCount3 := leftClickCount2
    leftClickCount2 := leftClickCount1
    leftClickCount1 := leftClickCount0
    leftClickCount0 := 0
}
RightUpdate(*) {
    global rightClickCount0, rightClickCount1, rightClickCount2, rightClickCount3, rightClickCount4, rightClickCount5, rightClickCount6, rightClickCount7, rightClickCount8, rightClickCount9
    
    rightUpText.Value := rightClickCount0 + rightClickCount1 + rightClickCount2 + rightClickCount3 + rightClickCount4 + rightClickCount5 + rightClickCount6 + rightClickCount7 + rightClickCount8 + rightClickCount9
    rightDownText.Value := rightClickCountSum
    rightClickCount9 := rightClickCount8
    rightClickCount8 := rightClickCount7
    rightClickCount7 := rightClickCount6
    rightClickCount6 := rightClickCount5
    rightClickCount5 := rightClickCount4
    rightClickCount4 := rightClickCount3
    rightClickCount3 := rightClickCount2
    rightClickCount2 := rightClickCount1
    rightClickCount1 := rightClickCount0
    rightClickCount0 := 0
}
MoveWindowToTop(*) {
    if (ConstantlyMoveToTop == 1) {
        WinMoveTop(myGui)
    }
}

~LButton::{
    global leftClickCount0, leftClickCountSum
    global winPosX, winPosY, mousePosOriginalX, mousePosOriginalY, dragging
    global activeWindow
    global myGui
    leftClickCount0++
    leftClickCountSum++
    MouseGetPos(&mousePosOriginalX, &mousePosOriginalY)
    if winPosX <= mousePosOriginalX && mousePosOriginalX <= winPosX + 132 && winPosY <= mousePosOriginalY && mousePosOriginalY <= winPosY + 76 {
        dragging := 1
    }
}
LButton Up::{
    global dragging, winPosX, winPosY, winPosFinalX, winPosFinalY
    if dragging {
        dragging := 0
        winPosFinalX := winPosX
        winPosFinalY := winPosY
    }
}
~RButton::{
    global rightClickCount0, rightClickCountSum
    rightClickCount0++
    rightClickCountSum++
}
RButton Up::{
    global winPosX, winPosY, mousePosOriginalX2, mousePosOriginalY2, ConstantlyMoveToTop, myGui
    MouseGetPos(&mousePosOriginalX2, &mousePosOriginalY2)
    if winPosX <= mousePosOriginalX2 && mousePosOriginalX2 <= winPosX + 132 && winPosY <= mousePosOriginalY2 && mousePosOriginalY2 <= winPosY + 76 && Winactive(myGui) {
        ConstantlyMoveToTop := 1 - ConstantlyMoveToTop
        WinSetAlwaysOnTop(-1, myGui)
    }
}

DragGui(*) {
    global winPosX, winPosY, dragging
    if dragging {
        mousePosX := 0
        mousePosY := 0
        MouseGetPos(&mousePosX, &mousePosY)
        winPosX := mousePosX - mousePosOriginalX  + winPosFinalX
        winPosY := mousePosY - mousePosOriginalY + winPosFinalY
        WinMove(winPosX, winPosY,,, myGui.Title)
        
    }
}