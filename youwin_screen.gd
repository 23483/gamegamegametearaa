extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ttime = GameData.final_time
	var secs = int(ttime)
	var mins = int(secs / 60)
	var dissecs = secs % 60
	var desi = int((ttime - secs)*100)
	$time.text = "runtime: %02d:%02d.%02d" % [mins, dissecs, desi]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_buttonquit_3_pressed() -> void:
	get_tree().quit() # Replace with function body.


func _on_again_pressed() -> void:
	get_tree().change_scene_to_file("res://the assets/world.tscn") # Replace with function body.


func _on_main_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn") # Replace with function body.
