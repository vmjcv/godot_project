# Tool generated file DO NOT MODIFY
tool

class special_func_infoData:
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
		1:special_func_infoData.new("10%机率使敌人陷入<中毒>状态 ", 1, "中毒", 0.1),
		2:special_func_infoData.new("20%机率使敌人陷入<中毒>状态 ", 2, "中毒", 0.2),
		3:special_func_infoData.new("10%机率使敌人陷入<石化>状态 ", 3, "石化", 0.1),
		4:special_func_infoData.new("20%机率使敌人陷入<石化>状态 ", 4, "石化", 0.2),
		5:special_func_infoData.new("10%机率使敌人陷入<封魔>状态 ", 5, "封魔", 0.1),
		6:special_func_infoData.new("20%机率使敌人陷入<封魔>状态 ", 6, "封魔", 0.2),
		7:special_func_infoData.new("10%机率使敌人陷入<冻结>状态 ", 7, "冻结", 0.1),
		8:special_func_infoData.new("20%机率使敌人陷入<冻结>状态 ", 8, "冻结", 0.2),
		9:special_func_infoData.new("10%机率使敌人陷入<封技>状态 ", 9, "封技", 0.1),
		10:special_func_infoData.new("20%机率使敌人陷入<封技>状态 ", 10, "封技", 0.2),
		11:special_func_infoData.new("10%机率使敌人陷入<睡眠>状态 ", 11, "睡眠", 0.1),
		12:special_func_infoData.new("20%机率使敌人陷入<睡眠>状态 ", 12, "睡眠", 0.2),
		13:special_func_infoData.new("10%机率使敌人陷入<黑暗>状态 ", 13, "黑暗", 0.1),
		14:special_func_infoData.new("20%机率使敌人陷入<黑暗>状态 ", 14, "黑暗", 0.2),
		15:special_func_infoData.new("10%机率使敌人陷入<即死>状态 ", 15, "即死", 0.1),
		16:special_func_infoData.new("20%机率使敌人陷入<即死>状态 ", 16, "即死", 0.2),
		17:special_func_infoData.new("10%机率使敌人陷入<混乱>状态 ", 17, "混乱", 0.1),
		18:special_func_infoData.new("20%机率使敌人陷入<混乱>状态 ", 18, "混乱", 0.2),
		19:special_func_infoData.new("10%几率使出会心一击", 19, "会心一击", 0.1),
		20:special_func_infoData.new("20%几率使出会心一击", 20, "会心一击", 0.2),
		21:special_func_infoData.new("10%机率解除敌人驱动中的战技或魔法", 21, "解除驱动", 0.1),
		22:special_func_infoData.new("15%机率解除敌人驱动中的战技或魔法", 22, "解除驱动", 0.15),
		23:special_func_infoData.new("20%机率解除敌人驱动中的战技或魔法", 23, "解除驱动", 0.2),
		24:special_func_infoData.new("25%机率解除敌人驱动中的战技或魔法", 24, "解除驱动", 0.25),
		25:special_func_infoData.new("30%机率解除敌人驱动中的战技或魔法", 25, "解除驱动", 0.3),
		26:special_func_infoData.new("可以看到敌方的详细信息", 26, "情报", 1),
	}
