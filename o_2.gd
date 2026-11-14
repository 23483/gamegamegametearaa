extends Area2D

var explode = false

@onready var Protron: Sprite2D = $Protron
@onready var Protron2: Sprite2D = $Protron2
@onready var Protron3: Sprite2D = $Protron3
@onready var Protron4: Sprite2D = $Protron4
@onready var Protron5: Sprite2D = $Protron5
@onready var Protron6: Sprite2D = $Protron6
@onready var Protron7: Sprite2D = $Protron7
@onready var Protron8: Sprite2D = $Protron8

@onready var Nutron: Sprite2D = $Nutron
@onready var Nutron2: Sprite2D = $Nutron2
@onready var Nutron3: Sprite2D = $Nutron3
@onready var Nutron4: Sprite2D = $Nutron4
@onready var Nutron5: Sprite2D = $Nutron5
@onready var Nutron6: Sprite2D = $Nutron6
@onready var Nutron7: Sprite2D = $Nutron7
@onready var Nutron8: Sprite2D = $Nutron8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Nutron.visible = false
	$Protron.visible = false # Replace with function body.
	$Nutron2.visible = false
	$Protron2.visible = false 
	$Nutron3.visible = false
	$Protron3.visible = false 
	$Nutron4.visible = false
	$Protron4.visible = false 
	$Nutron5.visible = false
	$Protron5.visible = false 
	$Nutron6.visible = false
	$Protron6.visible = false 
	$Nutron7.visible = false
	$Protron7.visible = false 
	$Nutron8.visible = false
	$Protron8.visible = false 
	$nucu.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if explode:
		$Nutron.visible = true
		$Protron.visible = true
		$nucu.visible = false
		$Nutron.visible = true
		$Protron.visible = true # Replace with function body.
		$Nutron2.visible = true
		$Protron2.visible = true 
		$Nutron3.visible = true
		$Protron3.visible = true 
		$Nutron4.visible = true
		$Protron4.visible = true 
		$Nutron5.visible = true
		$Protron5.visible = true 
		$Nutron6.visible = true
		$Protron6.visible = true 
		$Nutron7.visible = true
		$Protron7.visible = true 
		$Nutron8.visible = true
		$Protron8.visible = true 
		Protron.position.y += delta*400
		Protron.position.x += delta*20
		Protron2.position.y += delta*20
		Protron2.position.x += delta*400
		Protron3.position.y += delta*400


func _on_body_entered(body: Node2D) -> void:
	$"../nuckp"._nuckp()
	explode = true
