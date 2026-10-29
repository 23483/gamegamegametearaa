
extends Camera2D

@export var nope: CharacterBody2D
@export var p2: CharacterBody2D

@export var follow_speed: float = 5.0
@export var min_zoom: float = 1
@export var max_zoom: float = 2.5
@export var zoom_margin: float = 250

@export var max_distance: float = 1150.0
@export var warning_distance: float = 850.0
@export var shake_strength: float = 8.0

var warning_shaking: bool = false
var base_offset: Vector2 = Vector2(225, 400)

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
	
	
	var p1 = get_parent().get_node("nope")
	

	if distance > warning_distance and distance < max_distance:
		var intensity = (distance - warning_distance) / (max_distance - warning_distance)
		offset = base_offset + Vector2(
			randf_range(-shake_strength * intensity, shake_strength * intensity),
			randf_range(-shake_strength * intensity, shake_strength * intensity)
		)
	else:
		offset = base_offset
