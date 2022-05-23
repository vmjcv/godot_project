# Tool generated file DO NOT MODIFY
tool

class bead_infoData:
	var all_type
	var bead_description
	var bead_name
	var id
	var main_type
	var special_func
	var special_magic
	var special_property
	func _init(p_all_type, p_bead_description, p_bead_name, p_id, p_main_type, p_special_func, p_special_magic, p_special_property):
		all_type = p_all_type
		bead_description = p_bead_description
		bead_name = p_bead_name
		id = p_id
		main_type = p_main_type
		special_func = p_special_func
		special_magic = p_special_magic
		special_property = p_special_property

static func load_configs():
	return {
		1:bead_infoData.new({1:3,4:7}, "1号珠子就是1号珠子", "1号珠子", 1, 1, [1,4], [1,3], [1]),
		2:bead_infoData.new({2:4,3:1}, "2号珠子就是2号珠子", "2号珠子", 2, 1, [2,3], [], []),
		3:bead_infoData.new({5:1,7:2}, "3号珠子就是3号珠子", "3号珠子", 3, 2, [5], [4,5], [2]),
		4:bead_infoData.new({6:1,3:3}, "4号珠子就是4号珠子", "4号珠子", 4, 3, [], [], []),
		5:bead_infoData.new({3:3,4:8}, "5号珠子就是5号珠子", "5号珠子", 5, 1, [1,4], [1,3], [2]),
		6:bead_infoData.new({5:4,3:2}, "6号珠子就是6号珠子", "6号珠子", 6, 1, [2,4], [], []),
		7:bead_infoData.new({5:1,7:3}, "7号珠子就是7号珠子", "7号珠子", 7, 2, [6], [4,6], [3]),
		8:bead_infoData.new({6:1,3:4}, "8号珠子就是8号珠子", "8号珠子", 8, 3, [], [], []),
		9:bead_infoData.new({1:3,4:9}, "9号珠子就是9号珠子", "9号珠子", 9, 1, [1,4], [1,3], [3]),
	}
