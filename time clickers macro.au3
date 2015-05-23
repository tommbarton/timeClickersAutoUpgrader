Opt("WinTitleMatchMode", 2)
Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 1)
$aboutitem = TrayCreateItem("About | Help")
TrayItemSetOnEvent(-1, "ReadList")
TrayCreateItem("")
$exititem = TrayCreateItem("Exit")
TrayItemSetOnEvent(-1, "ReadList")

Local $isPaused = 0 ;creates global variable to check if the game is paused.

HotKeySet ( "{F11}", "toExit")		;sets the exit hotkey to F11
HotKeySet ( "{F10}", "togglePause")	;sets pause hotkey to F10
HotKeySet ( "{F9}", "autoUpgrade")	;sets the upgrade hotkey to F9

about()	;call the about screen

Func about()
   MsgBox(64, "Time Clickers Auto-Upgrader", "Upgrades Time Clickers weapons automatically." & @CRLF & @CRLF & "To start:" & @CRLF & "Ensure the game is open in a browser." & @CRLF & "Press the F9 key." & @CRLF & "Click one of the upgrade buttons." & @CRLF & "Leave it running as the active window." & @CRLF & @CRLF & "To pause:" & @CRLF & "Press F10." & @CRLF & @CRLF & "To Exit:" & @CRLF & "Press F11." & @CRLF & @CRLF & "by Tom Barton")
EndFunc

Func readlist()
	$selecteditem = TrayItemGetText(@TRAY_ID)
	If $selecteditem = "Exit" Then
		Exit
	ElseIf $selecteditem = "About | Help" Then
		Call("About")
	EndIf
EndFunc

Local $hWnd = WinGetHandle("Play — Time Clickers")
Local $hControl = ControlGetHandle($hWnd, "", "[CLASS:Unity.WebPlayer; INSTANCE:1]")

Func togglePause()
	If $isPaused == 0 Then
		$isPaused = 1
		MsgBox(64, "Time Clickers Auto-Upgrader","Time Clickers Auto-Upgrader is now paused." & @CRLF & @CRLF & "To start again:" & @CRLF & "Ensure the game is open in a browser." & @CRLF & "Press the F9 key." & @CRLF & "Click one of the upgrade buttons." & @CRLF & "Leave it running as the active window." & @CRLF & @CRLF & "To Exit:" & @CRLF & "Press F11.")
	Else
		$isPaused = 0
		autoUpgrade()
		EndIf
EndFunc



Func autoUpgrade()
	While 1
	ControlFocus($hWnd, "", "")
	   ControlSend ($hWnd, "", $hControl, "a")
	   ;If $isPaused == 1 Then ExitLoop
	   sleep(500)
	   ControlSend ($hWnd, "", $hControl, "s")
	   ;If $isPaused == 1 Then ExitLoop
	   sleep(500)
	   ControlSend ($hWnd, "", $hControl, "d")
	   ;If $isPaused == 1 Then ExitLoop
	   sleep(500)
	   ControlSend ($hWnd, "", $hControl, "f")
	   ;If $isPaused == 1 Then ExitLoop
	   sleep(500)
	   ControlSend ($hWnd, "", $hControl, "g")
	   ;If $isPaused == 1 Then ExitLoop
	   sleep(500)
	WEnd
EndFunc

While 1
	sleep(500)
WEnd

func toExit()
	MsgBox(64,"Time Clickers Auto-Upgrader","The script will now close.")
	Exit
EndFunc