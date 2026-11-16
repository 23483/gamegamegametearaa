extends Area2D

var reseting = false





@export var p2spawn: Vector2 = Vector2(150, 50)


func _process(_delta: float) -> void:
	if get_overlapping_bodies().size() > 0 and not reseting:
		reseting = true
		
		
		get_tree().change_scene_to_file("res://main_menu.tscn")
		

	if get_overlapping_bodies().size() == 0 and reseting:
				reseting = false
