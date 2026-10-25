extends Area2D

@export var platform: Node2D
@export var move_amount: Vector2 = Vector2(-1000, 0)
@export var move_duration: float = 5.0

var activated: bool = false

func _process(_delta: float) -> void:
	for body in get_overlapping_bodies():
		if body.name == "nope" or body.name == "p2":
			if not activated:
				activated = true
				var target_position = platform.position + move_amount
				var tween = create_tween()
				tween.tween_property(
					platform,
					"position",
					target_position,
					move_duration
				).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
