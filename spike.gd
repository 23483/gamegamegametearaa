extends Area2D

var reseting = false


@export var p2: CharacterBody2D 
@export var nope: CharacterBody2D

@export var p2spawn: Vector2 = Vector2(150, 50)
@export var nopespawn: Vector2 = Vector2(200, 50)

func _process(_delta: float) -> void:
	if get_overlapping_bodies().size() > 0 and not reseting:
		reseting = true
		print("overlap")
		get_tree().call_group("players", "respawn")
		nope.velocity = Vector2.ZERO
		$"../CanvasLayer/reset counter".count()
		$"../CanvasLayer/dethtime".reset_timer()
	if get_overlapping_bodies().size() == 0 and reseting:
				reseting = false
