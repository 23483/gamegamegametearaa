extends Area2D

@export var game_timer: Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_overlapping_bodies().size() > 1:
		GameData.final_time = game_timer.keptime
		get_tree().change_scene_to_file("res://youwin screen.tscn")
