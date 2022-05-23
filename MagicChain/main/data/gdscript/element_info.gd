# Tool generated file DO NOT MODIFY
tool

class element_infoData:
	var element_color
	var element_description
	var element_name
	var id
	func _init(p_element_color, p_element_description, p_element_name, p_id):
		element_color = p_element_color
		element_description = p_element_description
		element_name = p_element_name
		id = p_id

static func load_configs():
	return {
		1:element_infoData.new("d18723", "地元素", "地", 1),
		2:element_infoData.new("2623d1", "水元素", "水", 2),
		3:element_infoData.new("d14523", "火元素", "火", 3),
		4:element_infoData.new("23d128", "风元素", "风", 4),
		5:element_infoData.new("938da3", "时元素", "时", 5),
		6:element_infoData.new("e4f598", "空元素", "空", 6),
		7:element_infoData.new("675570", "幻元素", "幻", 7),
	}
