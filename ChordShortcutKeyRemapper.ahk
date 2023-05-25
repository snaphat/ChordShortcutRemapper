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
