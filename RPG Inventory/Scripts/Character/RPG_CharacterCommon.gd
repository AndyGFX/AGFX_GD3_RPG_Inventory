# --------------------------------------------------------------
# add script to ProjectSetting/Autoload as RPG_CharacterCommon 
# --------------------------------------------------------------

extends Node

# values

var HP = 53
var maxHP = 150

var energy = 70
var maxEnergy = 80

var speed = 50
var maxSpeed = 200

var armor = 20
var maxArmor = 90

# UI firels

var ui_hp_field
var ui_speed_field
var ui_energy_field
var ui_armor_field


func Update():
	self.ui_hp_field.text = str(self.HP) + "/" + str(self.maxHP)
	self.ui_speed_field.text = str(self.speed) + "/" + str(self.maxSpeed)
	self.ui_energy_field.text = str(self.energy) + "/" + str(self.maxEnergy)
	self.ui_armor_field.text = str(self.armor) + "/" + str(self.maxArmor)
	
func Add_HP(val):
	self.HP += val
	if self.HP > self.maxHP: self.HP = self.maxHP
	if self.HP < 0:  self.HP = 0
	
func Add_Energy(val):
	self.energy += val
	if self.energy > self.maxEnergy: self.energy = self.maxEnergy
	if self.energy < 0:  self.energy = 0
	
func Add_Speed(val):
	self.speed += val
	if self.speed > self.maxSpeed: self.speed = self.maxSpeed
	if self.speed < 0:  self.speed = 0
	
func Add_Armor(val):
	self.armor += val
	if self.armor > self.maxArmor: self.armor = self.maxArmor
	if self.armor < 0:  self.armor = 0
	
func GetMaxValueOfMax():
	var res = - 1000
	if self.maxSpeed > res: res = self.maxSpeed
	if self.maxHP > res: res = self.maxHP
	if self.maxArmor > res: res = self.maxArmor
	if self.maxEnergy > res: res = self.maxEnergy
	return res