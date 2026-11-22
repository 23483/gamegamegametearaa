extends StaticBody2D

@export var sped = 300



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= sped * delta



func _on_area_2d_body_entered(body: Node2D) -> void:
	position.x = 1800 # Replace with function body.
