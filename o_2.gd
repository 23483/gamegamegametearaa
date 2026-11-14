extends Area2D

var explode = false
var resett = true
@onready var nucparts: GPUParticles2D = $GPUParticles2D
@onready var proparts: GPUParticles2D = $GPUParticles2D3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$nucu.visible = true




func _on_body_entered(body: Node2D) -> void:
	$"../nuckp"._nuckp()
	explode = true
	if resett:
		nucparts.restart()
		proparts.restart()
	resett = false
	$nucu.visible = false
