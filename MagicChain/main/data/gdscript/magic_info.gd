# Tool generated file DO NOT MODIFY
tool

class magic_infoData:
	var description
	var id
	var name
	var need
	var type
	func _init(p_description, p_id, p_name, p_need, p_type):
		description = p_description
		id = p_id
		name = p_name
		need = p_need
		type = p_type

static func load_configs():
	return {
		1:magic_infoData.new("在敌人头上砸下巨大的岩石", 1, "石之锤", {1:1}, 1),
		2:magic_infoData.new("喷洒大范围毒气，20％机率造成“石化”", 2, "岩石之云", {1:5,4:3}, 1),
		3:magic_infoData.new("将沉重的水块掷向敌人", 3, "水之矢", {2:1}, 2),
		4:magic_infoData.new("解除队友“战斗不能”以外的异常状态", 4, "治愈术", {2:2,7:1}, 2),
		5:magic_infoData.new("击出燃烧的火球", 5, "火之矢", {3:1}, 3),
		6:magic_infoData.new("获得火焰的守护，一定时间内STR+25％", 6, "强力之音", {3:2,4:1,6:1,7:1}, 3),
		7:magic_infoData.new("呼出压缩的气块将敌人撕裂", 7, "风之轮", {4:1}, 4),
		8:magic_infoData.new("卷起猛烈的龙卷风将敌人一扫而空", 8, "天龙卷", {4:20,1:3,6:5}, 4),
		9:magic_infoData.new("削减生命的时之刃，20％机率造成“战斗不能”", 9, "暗影之矛", {5:7}, 5),
		10:magic_infoData.new("一定时间内强制禁止范围内的敌人使用魔法", 10, "反魔法领域.复", {5:7,4:1,6:3}, 5),
		11:magic_infoData.new("使用高压的空间压迫敌人 ", 11, "暗物质", {6:4}, 6),
		12:magic_infoData.new("以惊异的破坏力来压缩空间的失传魔法", 12, "风暴降临", {6:21,3:12,4:5,5:8,7:12}, 6),
		13:magic_infoData.new("产生限制敌人认知能力的力场，20％机率造成“封技”", 13, "次元上升", {7:1}, 7),
		14:magic_infoData.new("获得攻守两面的守护，一定时间内STR+25％、DEF+25％", 14, "神圣祝福", {7:3,1:1,2:1,3:1,4:1,6:1}, 7),
	}
