extends Reference
class_name Element

const table_path = "element_info"
var id setget set_id,get_id # 元素id
var _table_info
var element_name setget ,get_element_name # 元素名字
var description setget ,get_description # 元素描述
var color setget ,get_color # 元素颜色

var number:=0 setget ,get_number

func set_id(value):
	id = value
	_table_info = get_table_info()
	
func get_id():
	return id
	
func get_table_info():
	return Configs.get_by_id(table_path,id)
	
func get_element_name():
	return _table_info.element_name
	
func get_description():
	return _table_info.element_description
	
func get_color():
	return _table_info.element_color

func get_number():
	return number
	
func add_one():
	number = number + 1
	
func add_number(p_number):
	number = number + p_number
	
func add_element(other_element):
	number = number + other_element.number
	
func less_equal(other_element):
	return number <= other_element.number
	
func less(other_element):
	return number < other_element.number
