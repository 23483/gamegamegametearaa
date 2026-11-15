extends Area2D

@onready var electrons: CollisionShape2D = $CollisionShape2D
@onready var atom: Area2D = $o2


var explode = false
var resett = true
@onready var nucparts: GPUParticles2D = $GPUParticles2D
@onready var proparts: GPUParticles2D = $GPUParticles2D3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$nucu.visible = true
	$CollisionShape2D.disabled = false



func _process(delta: float) -> void:
	electrons.rotate(delta * 5)
	position.y += delta * 90




func _on_area_entered(area: Area2D) -> void:
	$"../nuckp"._nuckp()
	explode = true
	if resett:
		nucparts.restart()
		proparts.restart()
	resett = false
	$nucu.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
