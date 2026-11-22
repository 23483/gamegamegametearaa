extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("pause"):
		get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
