
extends Camera2D

@export var nope: CharacterBody2D
@export var p2: CharacterBody2D

@export var follow_speed: float = 5.0
@export var zoom_factor: float = 2.0

func _ready() -> void:
	zoom = Vector2(zoom_factor, zoom_factor)

func _process(delta: float) -> void:
	if nope == null or p2 == null:
		return

	var midpoint = (nope.global_position + p2.global_position) / 2.0

	global_position = global_position.lerp(
		midpoint,
		1.0 - exp(-follow_speed * delta)
	)
