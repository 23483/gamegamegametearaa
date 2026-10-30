extends Label

@onready var keptime = 0
var kepttime = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start() # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	keptime = delta + keptime
	kepttime = int(keptime)
	var mins = int(keptime / 60)
	print(mins)
	var seconds = kepttime % 60
	print(seconds)
	var centisecs = int((keptime - kepttime)*100)
	text = "Gametime: " + str(mins) + ":" + str(seconds) + "." + str(centisecs)
	
