Scriptname Fallout:Gameplay:Settings:TimeScale extends Terminal
import Papyrus:Diagnostics:Log

UserLog Log


Event OnInit()
	Log = new UserLog
	Log.Caller = self
	Log.FileName = "Gameplay"
EndEvent


Event OnMenuItemRun(int auiMenuItemID, ObjectReference akTerminalRef)
	WriteLine(Log, "OnMenuItemRun :: auiMenuItemID="+auiMenuItemID + ", akTerminalRef="+akTerminalRef)

	If (auiMenuItemID == 1)
		return
	ElseIf (auiMenuItemID == 2)
		SetTimeScale(akTerminalRef, 20.0)
	ElseIf (auiMenuItemID == 3)
		SetTimeScale(akTerminalRef, 18.0)
	ElseIf (auiMenuItemID == 4)
		SetTimeScale(akTerminalRef, 16.0)
	ElseIf (auiMenuItemID == 5)
		SetTimeScale(akTerminalRef, 14.0)
	ElseIf (auiMenuItemID == 6)
		SetTimeScale(akTerminalRef, 12.0)
	ElseIf (auiMenuItemID == 7)
		SetTimeScale(akTerminalRef, 10.0)
	ElseIf (auiMenuItemID == 8)
		SetTimeScale(akTerminalRef, 8.0)
	ElseIf (auiMenuItemID == 9)
		SetTimeScale(akTerminalRef, 6.0)
	ElseIf (auiMenuItemID == 10)
		SetTimeScale(akTerminalRef, 4.0)
	ElseIf (auiMenuItemID == 11)
		SetTimeScale(akTerminalRef, 2.0)
	EndIf
EndEvent


Function SetTimeScale(ObjectReference akTerminalRef, float afTimeScale)
	float current = TimeScale.GetValue()

	If (TimeScale)
		TimeScale.SetValue(afTimeScale)
		WriteChangedValue(Log, "TimeScale", current, afTimeScale)
	EndIf

	If (akTerminalRef == none)
		WriteLine(Log, "Cannot add text replacement to none terminal reference.")
	Else
		WriteLine(Log, "Added text replacement to " + akTerminalRef + " terminal reference.")
		akTerminalRef.AddTextReplacementData("TimeScale", TimeScale)
	EndIf
EndFunction


Group Fallout4
	GlobalVariable Property TimeScale Auto Const Mandatory
EndGroup
