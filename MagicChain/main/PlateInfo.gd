extends VBoxContainer

onready var chain_info = $Chain
onready var magic_info = $ScrollContainer/Magic
onready var property_info = $Property
onready var func_info = $Func


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func remove_all_children(node):
	var children = node.get_children()
	for child_node in children:
		node.remove_child(child_node)


func _on_Plate_update_info(element_map_list,build_magic,special_func,special_property):
	remove_all_children(chain_info)
	remove_all_children(magic_info)
	remove_all_children(property_info)
	remove_all_children(func_info)
	
	
	for element_map in element_map_list:
		var cur_str=""
		for i in element_map:
			var count = element_map[i].number
			cur_str+="%d:%d  "%[i,count]
		var label_node = Label.new()
		label_node.text = cur_str
		chain_info.add_child(label_node)
	
	for magic_key in build_magic:
		var magic = build_magic[magic_key]
		var label_node = Label.new()
		label_node.text = magic.magic_name+" : "+magic.description
		magic_info.add_child(label_node)
		
	for special_key in special_func:
		var one_special_func = special_func[special_key]
		var label_node = Label.new()
		label_node.text = one_special_func.special_func_name+" : "+one_special_func.description
		func_info.add_child(label_node)
	
	for special_key in special_property:
		var one_special_property = special_property[special_key]
		var label_node = Label.new()
		label_node.text = one_special_property.special_property_name+" : "+one_special_property.description
		property_info.add_child(label_node)
	
	
