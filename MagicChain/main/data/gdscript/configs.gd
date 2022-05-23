# Tool generated file DO NOT MODIFY
tool
extends Node

const bead_infoScript = preload("bead_info.gd")
const element_infoScript = preload("element_info.gd")
const magic_infoScript = preload("magic_info.gd")
const plate_infoScript = preload("plate_info.gd")
const special_func_infoScript = preload("special_func_info.gd")
const special_property_infoScript = preload("special_property_info.gd")

var configs = {
	"bead_info": {},
	"element_info": {},
	"magic_info": {},
	"plate_info": {},
	"special_func_info": {},
	"special_property_info": {},
}

func get_by_id(table_name: String, id:int):
	return configs.get(table_name,{}).get(id)

func get_table(table_name: String):
	return configs.get(table_name,{})

func _init():
	configs["bead_info"] = bead_infoScript.load_configs()
	configs["element_info"] = element_infoScript.load_configs()
	configs["magic_info"] = magic_infoScript.load_configs()
	configs["plate_info"] = plate_infoScript.load_configs()
	configs["special_func_info"] = special_func_infoScript.load_configs()
	configs["special_property_info"] = special_property_infoScript.load_configs()
