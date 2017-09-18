Scriptname Fallout:Gameplay:Setup extends Papyrus:Project:Modules:Required
import Papyrus:Log

UserLog Log


; Events
;---------------------------------------------

Event OnInitialize()
	Log = LogNew(Context.Title, self)
EndEvent


Event OnEnable()
	If (HasHolotape)
		WriteLine(Log, "Player already has a holotape." + Fallout_Gameplay_Holotape)
	Else
		Player.AddItem(Fallout_Gameplay_Holotape, 1, true)
		WriteLine(Log, "Added the holotape." + Fallout_Gameplay_Holotape)
	EndIf
EndEvent


; Properties
;---------------------------------------------

Group Properties
	Holotape Property Fallout_Gameplay_Holotape Auto Const Mandatory
EndGroup

Group Setup
	bool Property HasHolotape Hidden
		bool Function Get()
			return Player.GetItemCount(Fallout_Gameplay_Holotape) > 0
		EndFunction
	EndProperty
EndGroup
