# Tool generated file DO NOT MODIFY
tool

class plate_infoData:
	var chain
	var description
	var id
	var limited_grid
	func _init(p_chain, p_description, p_id, p_limited_grid):
		chain = p_chain
		description = p_description
		id = p_id
		limited_grid = p_limited_grid

static func load_configs():
	return {
		1:plate_infoData.new([[0,1,2],[0,3,4],[0,5,6]], "角色a的轮盘", 1, {0:1}),
		2:plate_infoData.new([[0,1,2,3,4],[0,5,6]], "角色b的轮盘", 2, {2:3,5:6}),
		3:plate_infoData.new([[0,6,1,2],[0,3,4,5]], "角色c的轮盘", 3, {}),
	}
