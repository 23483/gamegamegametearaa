extends Area2D

var speed = 1000
var direction = Vector2.ZERO

var downforse = 980.0
var vertical_speed = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	vertical_speed += downforse * delta
	position += direction * speed * delta
	position.y += vertical_speed * delta
