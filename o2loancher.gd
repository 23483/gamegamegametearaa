extends CollisionShape2D

const atom = preload("res://o_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bullet = atom.instantiate()
	get_tree().current_scene.add_child.call_deferred(bullet)
	bullet.global_position = Vector2(400, 300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
