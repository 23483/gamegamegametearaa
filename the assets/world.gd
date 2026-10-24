extends Node2D


@onready var icon: Sprite2D = $StaticBody2D5/christ
@onready var iconthingy: CollisionShape2D = $StaticBody2D5/inconthingy
@onready var anticrist_3: Sprite2D = $anticrist/anticrist2/anticrist3
@onready var anticrist2: Sprite2D = $anticrist/anticrist2
@onready var anticrist1: Sprite2D = $anticrist
@onready var icon22: Sprite2D = $Icon22
@onready var icon33: Sprite2D = $Icon22/icon33
@onready var nope: CharacterBody2D = $nope
@onready var platee: Sprite2D = $StaticBody2D4/plat
@onready var platf: CollisionShape2D = $StaticBody2D4/platf
@onready var p2: CharacterBody2D = $p2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	icon.rotate(delta * 6)
	iconthingy.rotate(delta * 6)
	anticrist_3.rotate(delta * -2)

	anticrist_3.position.x -= delta*10
	anticrist_3.position.y += delta*14
	anticrist2.position.x += delta*15
	anticrist2.position.y += delta*25
	anticrist1.rotate(delta*2)
	
	icon22.rotate(delta*2)
	icon33.rotate(delta*-2)

	platee.rotate(delta*2)
	platf.rotate(delta*2)


	if Input.is_action_pressed("left"):
		nope.position.x -=delta*150
	if Input.is_action_pressed("right"):
		nope.position.x += delta*150
	
	
	if Input.is_action_pressed("p2left"):
		p2.position.x -=delta*150
	if Input.is_action_pressed("p2right"):
		p2.position.x += delta*150
