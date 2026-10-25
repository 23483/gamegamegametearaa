extends Label

@onready var keptime = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start() # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	keptime = delta + keptime
	text = "Gametime: " + str(snappedf(keptime, 0.01))
	
