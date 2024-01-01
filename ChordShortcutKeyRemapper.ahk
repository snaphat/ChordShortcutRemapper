; Only start one-instance of the script.
#SingleInstance

; Set global window delay to make window movements faster and smoother.
SetWinDelay -1

#HotIf WinActive("ahk_exe msedge.exe", )

$esc::
{
    KeyWait "Esc"  ; Wait for Escape key to be released
    if (A_PriorHotkey = "$esc" && A_TimeSincePriorHotkey < 2000)
    {
        Send("^+a")  ; Send Ctrl+Shift+A
    }
    return
}

#HotIf

XButton1:: ; Mouse Button 4
{
    ; Get the current mouse position and the window it's over
    CoordMode("Mouse", "Screen")

    ; Get the current mouse position and the window it's over
    MouseGetPos(,, &activeWindow)

    ; Get the size and position of the active window
    WinGetPos(&winX, &winY, &winWidth, &winHeight, activeWindow)

    ; Retrieve the process name of the active window
    processName := WinGetProcessName(activeWindow)

    if(processName == "OneCommander.exe")
    {
        titleBarX := winX + winWidth - 170
        titleBarY := winY + 10
    }
    else
    {
        titleBarX := winX + winWidth / 2
        titleBarY := winY + 10
    }

    ; Move the mouse to the title bar
    MouseMove(titleBarX, titleBarY, 0)

    ; Click and hold the left mouse button
    Click("Down")

    ; Wait until Mouse Button 4 is released
    KeyWait("XButton1")

    ; Release the left mouse button
    Click("Up")
return
}
