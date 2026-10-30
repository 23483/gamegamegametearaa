extends Label

var dethtime = 0
var dethhtime = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dethtime = delta + dethtime
	dethhtime = int(dethtime)
	var mins = int(dethtime / 60)
	var seconds = dethhtime % 60
	var centisecs = int((dethtime - dethhtime)* 100)
	text = "runtime: " + str(mins) + ":" + str(seconds) + "." + str(centisecs)
	
	
func reset_timer():
	dethtime = 0
	dethhtime = 0
