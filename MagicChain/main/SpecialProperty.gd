extends Reference
class_name SpecialProperty

const table_path = "special_property_info"
var id setget set_id,get_id # 特殊属性id
var _table_info
var special_property_name setget ,get_special_property_name # 特殊属性名字
var description setget ,get_description # 特殊属性描述
var probability setget ,get_probability # 特殊属性发动概率


func set_id(value):
	id = value
	_table_info = get_table_info()
	
func get_id():
	return id
	
func get_table_info():
	return Configs.get_by_id(table_path,id)
	
func get_special_property_name():
	return _table_info.name
	
func get_description():
	return _table_info.description
	
func get_probability():
	return _table_info.probability
