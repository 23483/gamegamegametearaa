extends Node2D

@onready var icon: Sprite2D = $christ
@onready var anticrist_3: Sprite2D = $anticrist/anticrist2/anticrist3
@onready var anticrist2: Sprite2D = $anticrist/anticrist2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	icon.rotate(delta * 6)
	anticrist_3.rotate(delta * -1)
	anticrist_3.position.x += delta*9999
	anticrist_3.position.y -= delta*9999
	anticrist_3.position.x -= delta*9999
	anticrist_3.position.y += delta*9999
	anticrist2.position.x += delta*9
	anticrist2.position.y -= delta*9