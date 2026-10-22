extends Node2D

@onready var icon: Sprite2D = $christ
@onready var anticrist_3: Sprite2D = $anticrist/anticrist2/anticrist3
@onready var anticrist2: Sprite2D = $anticrist/anticrist2
@onready var anticrist1: Sprite2D = $anticrist
@onready var Icon22: Sprite2D = $Icon22
@onready var icon33: Sprite2D = $icon33
@onready var nope: Sprite2D = $nope
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	icon.rotate(delta * 6)
	icon.position.x +=delta*4
	anticrist_3.rotate(delta * -2)

	anticrist_3.position.x -= delta*10
	anticrist_3.position.y += delta*14
	anticrist2.position.x += delta*15
	anticrist2.position.y += delta*25
	anticrist1.rotate(delta*2)

	if Input.is_action_pressed("ui_jump"):
		nope.position.y += delta*10
	
	
	

	
	
