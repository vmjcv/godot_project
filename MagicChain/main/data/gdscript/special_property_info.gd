# Tool generated file DO NOT MODIFY
tool

class special_property_infoData:
	var description
	var id
	var name
	var probability
	func _init(p_description, p_id, p_name, p_probability):
		description = p_description
		id = p_id
		name = p_name
		probability = p_probability

static func load_configs():
	return {
		1:special_property_infoData.new("DEF+3%", 1, "DEF_A", 1),
		2:special_property_infoData.new("DEF+6%", 2, "DEF_A", 1),
		3:special_property_infoData.new("DEF+9%", 3, "DEF_A", 1),
		4:special_property_infoData.new("DEF-1%", 4, "DEF_S", 1),
		5:special_property_infoData.new("DEF-3%", 5, "DEF_S", 1),
		6:special_property_infoData.new("DEF-5%", 6, "DEF_S", 1),
		7:special_property_infoData.new("STR+3%", 7, "STR_A", 1),
		8:special_property_infoData.new("STR+6%", 8, "STR_A", 1),
		9:special_property_infoData.new("STR+9%", 9, "STR_A", 1),
		10:special_property_infoData.new("STR-1%", 10, "STR_S", 1),
		11:special_property_infoData.new("STR-3%", 11, "STR_S", 1),
		12:special_property_infoData.new("STR-5%", 12, "STR_S", 1),
		13:special_property_infoData.new("SPD+10%", 13, "SPD_A", 1),
		14:special_property_infoData.new("SPD+20%", 14, "SPD_A", 1),
		15:special_property_infoData.new("SPD+30%", 15, "SPD_A", 1),
	}
