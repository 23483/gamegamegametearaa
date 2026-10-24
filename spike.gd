extends Area2D

@onready var p2: CharacterBody2D = $p2
@onready var nope: CharacterBody2D = $nope

@export var nopespawn: Vector2 = Vector2(200, 50)
@export var p2spawn: Vector2 = Vector2(150, 50)

func _on_body_entered(body: Node2D) -> void:
	if body == p2:
		body.global_position = p2spawn
		body.velocity = Vector2.ZERO

	elif body == nope:
		body.global_position = nopespawn
		body.velocity = Vector2.ZERO
