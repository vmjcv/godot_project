extends Container
class_name Plate

const table_path = "plate_info"
export(int) var id setget set_id,get_id # 盘id
var _table_info
var description setget ,get_description # 盘描述
var grid_map:={} setget ,get_grid_map # 盘格子
var chain_list:=[] setget ,get_chain_list # 盘链条

export(PackedScene) var grid_scene

var center_pos
var grid_half_size
var separation
signal update_info

var direction_map ={
	0:Vector2(0,0),
	1:Vector2(0,-1),
	2:Vector2(0.866,-0.5),
	3:Vector2(0.866,0.5),
	4:Vector2(0,1),
	5:Vector2(-0.866,0.5),
	6:Vector2(-0.866,-0.5),
}


func set_id(value):
	center_pos = rect_size/2
	grid_half_size = grid_scene.instance().rect_min_size/2
	separation = grid_half_size*3
	print(grid_half_size)
	
	id = value
	_table_info = get_table_info()
	
	var all_child = get_children()
	for node in all_child:
		remove_child(node)
		
	grid_map = {}
	for i in range(7):
		var grid = grid_scene.instance()
		grid.direction = i
		add_child(grid)
		var cur_i = String(i)
		if cur_i in _table_info.limited_grid:
			grid.main_type = _table_info.limited_grid[cur_i]
		grid_map[i] = grid
		var direction = direction_map[i]
		grid.rect_position = direction*separation+center_pos-grid_half_size
		grid.connect("update_bead",self,"update_bead")
		
		
	chain_list = []
	for current_chain in _table_info.chain:
		var one_chain = []
		var cur_line = Line2D.new()
		cur_line.add_point(grid_map[0].rect_position+grid_half_size)
		for grid_direction in current_chain:
			one_chain.append(grid_map[int(grid_direction)])
			cur_line.add_point(grid_map[int(grid_direction)].rect_position+grid_half_size)
		add_child(cur_line)
		move_child(cur_line,0)
		chain_list.append(one_chain)
	
	
func get_id():
	return id
	
func get_table_info():
	return Configs.get_by_id(table_path,id)
	
	
func get_description():
	return _table_info.description
	
func get_grid_map():
	return grid_map

func get_chain_list():
	return chain_list


func get_elements_from_chain(chain_number):
	var current_chain = chain_list[chain_number]
	var element_map = {}
	
	for grid in current_chain:
		if grid.now_bead:
			var all_type = grid.now_bead.all_type
			for key in all_type:
				if not (key in element_map):
					element_map[key] = Element.new()
					element_map[key].id = key
				element_map[key].add_element(all_type[key])
	return element_map

func get_magic_from_chain(chain_number,build_magic={}):
	var element_map = get_elements_from_chain(chain_number)
	var magic_map = Configs.get_table("magic_info")
	for key in magic_map:
		var one_magic = Magic.new()
		one_magic.id = key
		if one_magic.can_build(element_map):
			build_magic[int(key)] = one_magic
	return build_magic
	
func update_bead():
	var element_map_list = []
	for i in range(chain_list.size()):
		element_map_list.append(get_elements_from_chain(i))

	var build_magic = {}
	for i in range(chain_list.size()):
		build_magic = get_magic_from_chain(i,build_magic)
	
	var special_func = {}
	var special_property = {}
	
	for i in grid_map:
		var grid = grid_map[i]
		if grid.now_bead:
			for key in grid.now_bead.special_magic:
				if key in build_magic:
					continue
				var one_magic = Magic.new()
				one_magic.id = key
				build_magic[key] = one_magic
				
			for key in grid.now_bead.special_func:
				if key in special_func:
					continue
				var one_special_func = SpecialFunc.new()
				one_special_func.id = key
				special_func[key] = one_special_func

			for key in grid.now_bead.special_property:
				if key in special_property:
					continue
				var one_special_property = SpecialProperty.new()
				one_special_property.id = int(key)
				special_property[key] = one_special_property

	emit_signal("update_info",element_map_list,build_magic,special_func,special_property)
