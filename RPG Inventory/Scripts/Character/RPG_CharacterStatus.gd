
extends TextureRect


func _ready():
	
	RPG_CharacterCommon.ui_hp_field     = Utils.find_node("HPValue")
	RPG_CharacterCommon.ui_energy_field = Utils.find_node("EnergyValue")
	RPG_CharacterCommon.ui_speed_field  = Utils.find_node("SpeedValue")
	RPG_CharacterCommon.ui_armor_field  = Utils.find_node("ArmorValue")
	
	RPG_CharacterCommon.Update()
	
	pass

