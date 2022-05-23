extends Reference
class_name Magic

const table_path = "magic_info"
var id setget set_id,get_id # 魔法id
var _table_info
var magic_name setget ,get_magic_name # 魔法名字
var description setget ,get_description # 魔法描述
var main_type setget ,get_main_type # 魔法类型
var need setget ,get_need # 魔法必须值


func set_id(value):
	id = value
	_table_info = get_table_info()
	
	main_type = Element.new()
	main_type.id = _table_info.type
	
	
	need = {}
	for key in _table_info.need:
		var cur_key = int(key)
		var one_type = Element.new()
		one_type.id = cur_key
		one_type.add_number(_table_info.need[key])
		need[cur_key] = one_type
	
	
func get_id():
	return id
	
func get_table_info():
	return Configs.get_by_id(table_path,id)
	
func get_magic_name():
	return _table_info.name
	
func get_description():
	return _table_info.description
	
func get_main_type():
	return main_type

func get_need():
	return need


func can_build(other_elements):
	for key in need:
		if need[key].number>0 and (not (key in other_elements)):
			return false
		if other_elements[key].less(need[key]):
			return false
	return true
