#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=cloud9.ico
#AutoIt3Wrapper_Outfile_x64=Cloud9.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Misc.au3>

$previousTitle = ''

If FileExists('c9.ini') then
	;do nothing
Else
	FileWrite('c9.ini',';^=Ctrl, !=Alt, +=Shift, special keys like {TAB}' & "\n")
	IniWrite('c9.ini','shortcuts','^{TAB}','^]')
EndIf

Global $shortcuts = IniReadSection('c9.ini', "shortcuts")

; Check if an error occurred.
If @error Then
	MsgBox(0, "Error", "Error loading shortcuts")
EndIf

While 1
	$winTitle = WinGetTitle("")
	if $previousTitle <> $winTitle Then
		if StringinStr($winTitle,"Cloud9") Then
			For $i = 1 To $shortcuts[0][0]
				HotKeySet($shortcuts[$i][0],'hotKey')
			Next
		Else
			For $i = 1 To $shortcuts[0][0]
				HotKeySet($shortcuts[$i][0])
			Next
		EndIf

	EndIf

	$previousTitle = $winTitle

	sleep(50)
WEnd

func hotKey()
	Global $shortcuts
	$checkHold = false
	For $i = 1 To $shortcuts[0][0]
		if $shortcuts[$i][0] == @HotKeyPressed Then
			if Stringinstr($shortcuts[$i][0],'^') and _IsPressed ( 11,'user32.dll' ) Then
				Send(StringReplace($shortcuts[$i][1],'^',"{CTRLDOWN}"))
				$checkHold = true
			Else
				Send($shortcuts[$i][1])
			EndIf

			If $checkHold Then
				sleep(200)
				if _IsPressed(11,'user32.dll') == false Then
					Send("{CTRLUP}")
				EndIf
			EndIf

		EndIf
    Next


EndFunc
