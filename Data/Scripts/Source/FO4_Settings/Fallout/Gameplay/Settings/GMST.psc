Scriptname Fallout:Gameplay:Settings:GMST extends Terminal
import Papyrus:Log

; This terminal will display the defined GMST values.

UserLog Log

Option[] Options
int TypeBool = 0 Const
int TypeInt = 1 Const
int TypeFloat = 2 Const
int TypeString = 3 Const


Struct Option
	int MenuItemID
	int Type
	string GMST
EndStruct


Event OnInit()
	Log = new UserLog
	Log.Caller = self
	Log.FileName = "Gameplay"


	Options = new Option[0]

	Option fGunShellLifetime = new Option
	fGunShellLifetime.MenuItemID = 1
	fGunShellLifetime.GMST = "fGunShellLifetime"
	fGunShellLifetime.Type = TypeFloat
	Options.Add(fGunShellLifetime)

	Option fGunShellCameraDistance = new Option
	fGunShellCameraDistance.MenuItemID = 2
	fGunShellCameraDistance.GMST = "fGunShellCameraDistance"
	fGunShellCameraDistance.Type = TypeFloat
	Options.Add(fGunShellCameraDistance)

	Option iDebrisMaxCount = new Option
	iDebrisMaxCount.MenuItemID = 3
	iDebrisMaxCount.GMST = "iDebrisMaxCount"
	iDebrisMaxCount.Type = TypeInt
	Options.Add(iDebrisMaxCount)

	Option iTerminalDisplayRate = new Option
	iTerminalDisplayRate.MenuItemID = 4
	iTerminalDisplayRate.GMST = "iTerminalDisplayRate"
	iTerminalDisplayRate.Type = TypeInt
	Options.Add(iTerminalDisplayRate)

	Option bEnableConsoleMenuDuringSurvival = new Option
	bEnableConsoleMenuDuringSurvival.MenuItemID = 5
	bEnableConsoleMenuDuringSurvival.GMST = "bEnableConsoleMenuDuringSurvival"
	bEnableConsoleMenuDuringSurvival.Type = TypeBool
	Options.Add(bEnableConsoleMenuDuringSurvival)
EndEvent



Event OnMenuItemRun(int auiMenuItemID, ObjectReference akTerminalRef)
	WriteLine(Log, "OnMenuItemRun :: auiMenuItemID="+auiMenuItemID + ", akTerminalRef="+akTerminalRef)

	int i = Options.FindStruct("MenuItemID", auiMenuItemID)
	SetOption(Options[i], akTerminalRef)
EndEvent



Function SetOption(Option aOption, ObjectReference akTerminalRef)
	If (aOption)
		If (aOption.Type == TypeFloat)
			float value = Game.GetGameSettingFloat(aOption.GMST)
			;Fallout_GlobalTemp.SetValue(value)
		EndIf
		If (akTerminalRef)
		;	akTerminalRef.AddTextReplacementData(aOption.GMST, Fallout_GlobalTemp)
		EndIf
	EndIf
EndFunction




;GlobalVariable Property Fallout_GlobalTemp Auto Const Mandatory





; Function ShowValue(string asGameSetting, var aValue)
; 	string msg = "The current " + asGameSetting + " equals " + aValue + "."
; 	WriteLine(Log, msg)
; 	Debug.MessageBox(msg)
; EndFunction
