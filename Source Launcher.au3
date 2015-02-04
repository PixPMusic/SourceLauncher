#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ProgressConstants.au3>
#include <MsgBoxConstants.au3>
FileChangeDir("Source Launcher")
$currentversion = "1.1.0"
updateAsk()


Func updateAsk()
   #Region ### START Koda GUI section ### Form=e:\programs\steam games\source mod\updateask.kxf
   $UpdateAsk = GUICreate("Source Launcher", 301, 101)
   $Label1 = GUICtrlCreateLabel("Check for Updates?", 16, 16, 99, 17)
   $YesButton = GUICtrlCreateButton("Yes", 112, 64, 75, 25)
   $NoButton = GUICtrlCreateButton("No", 208, 64, 75, 25)
   GUISetState(@SW_SHOW)
   #EndRegion ### END Koda GUI section ###

   While 1
	  $nMsg = GUIGetMsg()
	  Switch $nMsg
		 Case $GUI_EVENT_CLOSE
			   Exit

		 Case $YesButton
			GUISetState(@SW_HIDE)
			updateCheck()
		 Case $NoButton
			GUISetState(@SW_HIDE)
			gamePicker()
	  EndSwitch
   WEnd
 EndFunc

Func updateCheck()
#Region ### START Koda GUI section ### Form=e:\programs\steam games\source mod\updatecheck.kxf
$UpdateCheck = GUICreate("Source Lancher", 401, 101)
$Progress1 = GUICtrlCreateProgress(64, 56, 278, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$Label1 = GUICtrlCreateLabel("Checking for Updates", 64, 24, 107, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
GUICtrlSetData($Progress1, 0)
FileDelete("newversion.txt")
GUICtrlSetData($Progress1, 10)
RunWait("wget.exe http://pixelperfectserver.tk/source/newversion.txt")
sleep(1000)
GUICtrlSetData($Progress1, 50)
$newversion = FileReadLine("newversion.txt")
FileDelete("newversion.txt")
If $newversion = $currentversion Then
   MsgBox($MB_OK, "Source Launcher", "All up to date!")
   GUICtrlSetData($Progress1, 100)
   GUISetState(@SW_HIDE)
   gamePicker()
Else
   GUICtrlSetData($Progress1, 100)
   GUISetState(@SW_HIDE)
   updateApply()
EndIf

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
EndFunc

Func updateApply()
#Region ### START Koda GUI section ### Form=e:\programs\steam games\source mod\updater.kxf
$Updater = GUICreate("Source Launcher", 401, 101)
$Progress1 = GUICtrlCreateProgress(56, 56, 278, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$Label1 = GUICtrlCreateLabel("Updating", 64, 24, 47, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
GUICtrlSetData($Progress1, 0)
FileDelete("update.bet")
GUICtrlSetData($Progress1, 10)
RunWait("wget.exe http://pixelperfectserver.tk/source/update.bat")
sleep(1000)
GUICtrlSetData($Progress1, 50)
sleep(100)
GUICtrlSetData($Progress1, 90)
Run("update.bat")
Exit

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
EndFunc

Func gamePicker()
#Region ### START Koda GUI section ### Form=e:\programs\steam games\source mod\gamepicker.kxf
$GamePicker = GUICreate("Source Launcher", 577, 172)
$Label1 = GUICtrlCreateLabel("Pick a Game", 16, 16, 65, 17)
If FileExists(".\hl2") Then
   $hl2 = GUICtrlCreateButton("Half-Life 2", 16, 40, 123, 57)
Else
EndIf
$hl2e1 = GUICtrlCreateButton("Half-Life 2: Episode 1", 152, 40, 123, 57)
$hl2e2 = GUICtrlCreateButton("Half-Life 2: Episode 2", 288, 40, 131, 57)
$hl2lc = GUICtrlCreateButton("Half-Life 2: Lost Coast", 432, 40, 131, 57)
$portal = GUICtrlCreateButton("Portal", 16, 104, 123, 57)
$css = GUICtrlCreateButton("Counter Strike: Source", 152, 104, 123, 57)
$gmod = GUICtrlCreateButton("Garry's Mod", 288, 104, 131, 57)
$tf = GUICtrlCreateButton("Team Fortress 2", 432, 104, 131, 57)
$name = "Pfft"
$name = InputBox("Source Launcher", "Name? ", "", "", 200, 140)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $hl2
			DirMove("binhl2", "bin")
			RunWait("hl2.exe -game hl2 +name " & $name)
			DirMove("bin", "binhl2")
		Case $hl2e1
			DirMove("binhl2", "bin")
			RunWait("hl2.exe -game episodic +name " & $name)
			DirMove("bin", "binhl2")
		 Case $hl2e2
			DirMove("binhl2", "bin")
			RunWait("hl2.exe -game ep2 +name " & $name)
			DirMove("bin", "binhl2")
		 Case $hl2lc
			DirMove("binhl2", "bin")
			RunWait("hl2.exe -game lostcoast +name " & $name)
			DirMove("bin", "binhl2")
		 Case $portal
			DirMove("binhl2", "bin")
			RunWait("hl2.exe -game portal +name " & $name)
			DirMove("bin", "binhl2")
		 Case $css
			DirMove("binhl2", "bin")
			RunWait("hl2.exe -game cstrike +name " & $name)
			DirMove("bin", "binhl2")
		 Case $gmod
			DirMove("bingmod", "bin")
			RunWait("hl2.exe -game cstrike +name " & $name)
			DirMove("bin", "bingmod")
		 Case $tf
			MsgBox($MB_OK, "Source Launcher", "Sorry, I need to fix that one")
	  EndSwitch
   WEnd
EndFunc
