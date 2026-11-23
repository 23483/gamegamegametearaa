extends StaticBody2D
const spike = preload("res://spike.tscn")
var time = 0
var thingy = 0
var bounce = 0
var time2 = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spik = spike.instantiate()
	get_tree().current_scene.add_child(spik)
	spik.global_position = Vector2(900, 400)
	print("spiky")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bounce = sin(time2 * 2.6) * 100
	thingy = sin(time2 * 1) * 1.6
	time2 += delta
	time += delta
	if time > 3:
		_spik.call_deferred()
	print(str(thingy))
	
	if thingy < 0:
		thingy = thingy * -1
	
func _spik() -> void:
	var spik = spike.instantiate()
	get_tree().current_scene.add_child(spik)
	spik.global_position = Vector2(1250, 420) + Vector2(bounce, 0)
	
	spik.scale = Vector2(thingy, thingy)
	time = 0
	print("spikyy")
