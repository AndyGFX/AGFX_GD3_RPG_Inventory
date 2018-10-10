# main item class
extends TextureRect

var itemIcon;
var itemName;
var itemValue;
var itemDesc;

var itemSlot;
var picked = false;

var lblItemName
var lblItemValue
var lblItemDesc
var texItemPreview

func _init():
	pass

func Init(itemName, itemTexture, itemSlot, itemValue,itemDesc):
	name = itemName;
	self.itemName = itemName;
	self.itemValue = itemValue;
	self.itemDesc = itemDesc;
	texture = itemTexture;	
	self.itemSlot = itemSlot;
	mouse_filter = Control.MOUSE_FILTER_PASS;
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND;

	# assign item info labels
	lblItemName   = Utils.find_node("Label_ItemName")
	lblItemValue  = Utils.find_node("Label_ItemValue")
	lblItemDesc   = Utils.find_node("Label_ItemDesc")
	texItemPreview= Utils.find_node("Texture_ItemPreview")
	
	connect("mouse_entered",self,"OnMouseEntered")
	connect("mouse_exited",self,"OnMouseExited")
	
	pass
	
func pickItem():
	mouse_filter = Control.MOUSE_FILTER_IGNORE;
	picked = true;	
	pass
	
func putItem(local_offset):
	rect_global_position = Utils.find_node("RPG_InventoryControl").get_global_rect().position + local_offset
	mouse_filter = Control.MOUSE_FILTER_PASS;
	picked = false;
	pass

func UpdateItemInfo():
	
	lblItemName.text = "Name: %s" % [itemName]
	lblItemValue.text = "Value: %s" % [str(itemValue)]
	lblItemDesc.text = "Desc.: %s" % [itemDesc]
	texItemPreview.texture = texture
	
func CleanItemInfo():
	
	lblItemName.text = "Name:"
	lblItemValue.text = "Value:"
	lblItemDesc.text = "Desc.:"
	texItemPreview.texture = null
	
	
func OnMouseEntered():
	if RPG_InventoryCommon.disableInventory: return;
	self.UpdateItemInfo()
	
func OnMouseExited():
	if RPG_InventoryCommon.disableInventory: return;
	self.CleanItemInfo()
	
	
func OnUse():
	RPG_InventoryCommon.HideCommands()
	self.CleanItemInfo()
	print("ITEM: "+self.itemName+" was USEed")
	pass
	
func OnEat():
	RPG_InventoryCommon.HideCommands()
	self.CleanItemInfo()
	print("ITEM: "+self.itemName+" was EAT")
	pass
	
func OnDrop():
	self.CleanItemInfo()
	RPG_InventoryCommon.HideCommands()
	print("ITEM: "+self.itemName+" was DROPed")
	pass
	
func OnDelete():
	self.CleanItemInfo()
	RPG_InventoryCommon.HideCommands()
	print("ITEM: "+self.itemName+" was DELeted")
	pass
	
func OnClose():
	self.CleanItemInfo()
	RPG_InventoryCommon.HideCommands()
	print("PANEL was closed")
	pass	
	
