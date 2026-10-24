
extends Camera2D

@export var nope: CharacterBody2D
@export var p2: CharacterBody2D

@export var follow_speed: float = 5.0
@export var min_zoom: float = 1
@export var max_zoom: float = 2.5
@export var zoom_margin: float = 250



func _process(delta: float) -> void:
	if nope == null or p2 == null:
		return

	var midpoint = (nope.global_position + p2.global_position) / 2.0

	global_position = global_position.lerp(
		midpoint,
		1.0 - exp(-follow_speed * delta)
	)
	
	var distance = nope.global_position.distance_to(
		p2.global_position
	)
	
	var target_zoom = clamp(
		zoom_margin / max(distance, 1.0),
		min_zoom,
		max_zoom
	)
	zoom = zoom.lerp(
		Vector2(target_zoom, target_zoom),
		1.0- exp(-follow_speed * delta)
	)
