#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

Run "obs64.exe", "D:\MultiMedia\obs-studio\bin\64bit\"
WinWait "OBS",,10
Send "{F9}"
WinMinimize "OBS"

Send "+#{h}"
Run "D:\Utilities\Anki\anki.exe"
