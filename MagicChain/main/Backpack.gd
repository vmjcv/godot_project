extends ScrollContainer


var table_path = "bead_info"

export(PackedScene) var grid_scene
export(PackedScene) var bead_scene

onready var grid_container_node = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	var bead_table = Configs.get_table(table_path)
	var bead_size = bead_table.size()
	bead_size = int(ceil(bead_size/3)*3)
	var bead_keys = bead_table.keys()
	for i in range(bead_size):
		var grid_node = grid_scene.instance()
		grid_container_node.add_child(grid_node)
		var bead_node = bead_scene.instance()
		grid_node.add_child(bead_node)
		bead_node.id = bead_keys[i]
	
