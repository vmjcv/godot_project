extends ColorRect
class_name Bead
const table_path = "bead_info"
export(int) var id setget set_id,get_id # 珠子id
var _table_info
var bead_name setget ,get_bead_name # 珠子名字
var description setget ,get_description # 珠子名字
var main_type setget ,get_main_type # 主类型属性
var all_type:={} setget ,get_all_type # 所有的类型属性
var special_func:={} setget ,get_special_func # 特殊功能（如封技等）
var special_magic:={} setget ,get_special_magic # 特殊魔法（如珠子自带魔法）
var special_property:={} setget ,get_special_property # 特殊属性（如增加攻击力等）


func set_id(value):
	id = value
	_table_info = get_table_info()
	
	main_type = Element.new()
	main_type.id = _table_info.main_type
	
	all_type = {}
	for key in _table_info.all_type:
		var cur_key = int(key)
		var one_type = Element.new()
		one_type.id = cur_key
		one_type.add_number(_table_info.all_type[key])
		all_type[cur_key] = one_type

	special_func = {}
	for key in _table_info.special_func:
		var one_special_func = SpecialFunc.new()
		var cur_key = int(key)
		one_special_func.id = cur_key
		special_func[cur_key] = one_special_func

	special_magic = {}
	for key in _table_info.special_magic:
		var one_magic = Magic.new()
		var cur_key = int(key)
		one_magic.id = cur_key
		special_magic[cur_key] = one_magic
	
	special_property = {}
	for key in _table_info.special_property:
		var one_special_property = SpecialProperty.new()
		var cur_key = int(key)
		one_special_property.id = cur_key
		special_property[cur_key] = one_special_property
	
	color = main_type.color
	
func get_id():
	return id
	
func get_table_info():
	return Configs.get_by_id(table_path,id)

func get_bead_name():
	return _table_info.bead_name
	
func get_description():
	return _table_info.bead_description
	
func get_main_type():
	return main_type
	
func get_all_type():
	return all_type
	
func get_special_func():
	return special_func
	
func get_special_magic():
	return special_magic
	
func get_special_property():
	return special_property
	
func get_drag_data(position):
	var bead_node = self.duplicate()
	var data = {
		"id":id,
		"prev":self,
	}
	set_drag_preview(bead_node)
	bead_node.rect_min_size = Vector2(40,40)
	bead_node.rect_size = Vector2(40,40)
	return data
