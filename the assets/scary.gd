extends Area2D

var onescare
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Theface.visible = false
	onescare = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
		if onescare == true:
			$Theface.visible = true
			onescare = false


func _on_body_exited(body: Node2D) -> void:
		$Theface.visible = false
