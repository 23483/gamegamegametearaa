extends Area2D




@export var p2: CharacterBody2D 
@export var nope: CharacterBody2D

@export var p2spawn: Vector2 = Vector2(150, 50)
@export var nopespawn: Vector2 = Vector2(200, 50)

func _on_spikes_body_entered(body: Node2D) -> void:
	print("SPIKES DETECTED: ", body.name)
	print("SPIKES DETECTED: ", body.name)
	if body == p2 or body == nope:
		p2.global_position = p2spawn
		p2.velocity = Vector2.ZERO

		nope.global_position = nopespawn
		nope.velocity = Vector2.ZERO
	get_tree().call_group("players", "respawn")
	$"../CanvasLayer/dethtime".reset_timer()
	$"../CanvasLayer/reset counter".count()
