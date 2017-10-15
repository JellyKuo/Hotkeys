#SingleInstance force
#NoTrayIcon

Pause := 1
Calc := 1

Pause::
	if (Pause = 1)
	{
		DllCall("LockWorkStation")
	}
Return

+Pause::
	if (Pause = 0)
	{
		Pause = 1
		Display("Pause/Break 鎖定","Pause/Break 鍵鎖定電腦已啟用!")
	}
	else
	{
		Pause = 0
		Display("Pause/Break 鎖定","Pause/Break 鍵鎖定電腦已停用!")
	}
        
Return

#c::
	if (Calc = 1)
	{
		Run Calc.exe
	}

Return

#+c::
	if (Calc = 0)
	{
		Calc = 1
		Display("Win+C 小算盤","Win+C 開啟小算盤已啟用!")
	}
	else
	{
		Calc = 0
		Display("Win+C 小算盤","Win+C 開啟小算盤已停用!")
	}
Return

#`::  
	WinGet, currentWindow, ID, A
	WinGetTitle, currentTitle, ahk_id %currentWindow%
	WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
	if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
	{
		Winset, AlwaysOnTop, off, ahk_id %currentWindow%
		Display("最上層顯示", currentTitle " 取消最上層顯示")
	}
	else
	{
		WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
		Display("最上層顯示", currentTitle " 最上層顯示")
	}
Return

Display(Title, Message)
{
    TrayTip
	Menu Tray, Icon
	TrayTip, %Title%, %Message%,1,33
	Menu Tray, NoIcon
}