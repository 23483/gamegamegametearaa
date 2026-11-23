extends Area2D
var yuio = "player"
var thing
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	thing = body
	if body.is_in_group(yuio):
		thing.position.x += 3000
	
	thing = body
	print(thing)
	thing.position.x += 1824
