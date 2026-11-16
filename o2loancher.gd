extends CollisionShape2D

@export var span: CollisionShape2D

const atom = preload("res://o_2.tscn")

var newatomtime = 0

var displantment = 0
var fdisplacenmt = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bullet = atom.instantiate()
	get_tree().current_scene.add_child.call_deferred(bullet)
	bullet.global_position = span.global_position - Vector2(612, 400)
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	newatomtime = newatomtime + delta
	displantment = displantment + delta
	
	fdisplacenmt = displantment * 60
	
	if fdisplacenmt > 900:
		displantment = 2
	
	
	if newatomtime > 5:
			var bullet = atom.instantiate()
			get_tree().current_scene.add_child.call_deferred(bullet)
			bullet.global_position = span.global_position + Vector2(fdisplacenmt, 0)
			newatomtime = 0
