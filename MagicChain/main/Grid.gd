extends ColorRect
class_name Grid
var bead_scene = preload("res://main/Bead.tscn")
enum DIRECTION {
	CENTER, 
	NORTH,
	NORTH_EAST,
	SOUTH_EAST,
	SOUTH, 
	SOUTH_WEST, 
	NORTH_WEST,
}

var direction:=0 setget set_direction,get_direction
var main_type:=0 setget set_main_type,get_main_type # 为0时表示兼容所有类型
var now_bead setget set_bead,get_bead
signal update_bead

func set_direction(value):
	direction = value
	
func get_direction():
	return direction

func set_main_type(value):
	main_type = value
	if main_type == 0:
		color = "343d4b"
	else:
		var cur_element = Element.new()
		cur_element.id = value
		color = Color(cur_element.color).darkened(0.1)
	
func get_main_type():
	return main_type

func set_bead(value):
	now_bead = value
	
func get_bead():
	return now_bead

func can_drop_data(position, data):
	return now_bead!=data["prev"] and (main_type==0 or main_type==data["prev"].main_type.id)

func drop_data(position, data):
	var prev_node = data["prev"]
	var prev_node_parent = prev_node.get_parent()
	prev_node_parent.remove_child(prev_node)
	if now_bead:
		var cur_now_beed = now_bead
		remove_child(now_bead)
		prev_node_parent.add_child(cur_now_beed)

	add_child(prev_node)


func _on_Grid_child_entered_tree(node):
	set_bead(node)
	emit_signal("update_bead")


func _on_Grid_child_exited_tree(node):
	if get_bead() == node:
		set_bead(null)
		emit_signal("update_bead")
