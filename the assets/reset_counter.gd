extends Label
var resets = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	text = "reset count: " + str(resets)
	
func count():
	resets = resets + 1.0
