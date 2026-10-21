extends Node2D

@onready var icon: Sprite2D = $christ
@onready var anticrist_3: Sprite2D = $anticrist/anticrist2/anticrist3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	icon.rotate(delta * 6)
	anticrist_3.rotate(delta * -6)
