extends Label

var dethtime = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dethtime = delta + dethtime
	text = "runtime: " + str(snappedf(dethtime, 0.01))
func reset_timer():
	dethtime = 0.0
