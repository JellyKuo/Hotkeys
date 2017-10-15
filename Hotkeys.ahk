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
		Display("Pause/Break ��w","Pause/Break ����w�q���w�ҥ�!")
	}
	else
	{
		Pause = 0
		Display("Pause/Break ��w","Pause/Break ����w�q���w����!")
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
		Display("Win+C �p��L","Win+C �}�Ҥp��L�w�ҥ�!")
	}
	else
	{
		Calc = 0
		Display("Win+C �p��L","Win+C �}�Ҥp��L�w����!")
	}
Return

#`::  
	WinGet, currentWindow, ID, A
	WinGetTitle, currentTitle, ahk_id %currentWindow%
	WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
	if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
	{
		Winset, AlwaysOnTop, off, ahk_id %currentWindow%
		Display("�̤W�h���", currentTitle " �����̤W�h���")
	}
	else
	{
		WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
		Display("�̤W�h���", currentTitle " �̤W�h���")
	}
Return

Display(Title, Message)
{
    TrayTip
	Menu Tray, Icon
	TrayTip, %Title%, %Message%,1,33
	Menu Tray, NoIcon
}