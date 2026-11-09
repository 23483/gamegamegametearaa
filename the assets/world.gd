extends Node2D


@onready var icon: Sprite2D = $StaticBody2D5/christ
@onready var iconthingy: CollisionShape2D = $StaticBody2D5/inconthingy
@onready var anticrist_3: Sprite2D = $anticrist/anticrist2/anticrist3
@onready var anticrist2: Sprite2D = $anticrist/anticrist2
@onready var anticrist1: Sprite2D = $anticrist
@onready var icon22: Sprite2D = $Icon22
@onready var icon33: Sprite2D = $Icon22/icon33
@onready var nope: CharacterBody2D = $nope
@onready var platee: Sprite2D = $StaticBody2D4/plat
@onready var platf: CollisionShape2D = $StaticBody2D4/platf
@onready var p2: CharacterBody2D = $p2
@onready var spinn: Sprite2D = $DarkMatterAnomaly
@onready var spin: StaticBody2D = $StaticBody2D17
@onready var Maxdistance: float = 1150

@export var tutorial_spawn: Vector2 = Vector2(150, -720)
@export var game_spawn: Vector2 = Vector2(1200, -720)

var ani1 = true
var ani2 = true
var ani3 = true
var ani4 = true
var ani5 = true
var ani6 = true
var ani7 = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawn_position = tutorial_spawn
	

	
	
	if GameData.skip_tutorial:
		spawn_position = game_spawn
	GameData.checkpoint_position = spawn_position
	p2.respawn()
	nope.respawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	

	
	icon.rotate(delta * 6)
	iconthingy.rotate(delta * 6)
	anticrist_3.rotate(delta * -2)
	
	var distance = p2.global_position.distance_to(nope.global_position)
	
	if distance > Maxdistance:
		get_tree().call_group("players", "respawn")
		$"CanvasLayer/reset counter".count()
	
	anticrist_3.position.x -= delta*10
	anticrist_3.position.y += delta*14
	anticrist2.position.x += delta*15
	anticrist2.position.y += delta*25
	anticrist1.rotate(delta*2)
	
	icon22.rotate(delta*2)
	icon33.rotate(delta*-2)

	platee.rotate(delta*2)
	platf.rotate(delta*2)
	spinn.rotate(delta*2)
	spin.rotate(delta*-1.5)
	
	
	if Input.is_action_pressed("pause"):
			get_tree().change_scene_to_file("res://main_menu.tscn")
		
	if Input.is_action_pressed("left"):
		nope.position.x -=delta*150
	if Input.is_action_pressed("right"):
		nope.position.x += delta*150
	
	
	if Input.is_action_pressed("p2left"):
		p2.position.x -=delta*150
	if Input.is_action_pressed("p2right"):
		p2.position.x += delta*150
	
	


	
	


func _on_button_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_13_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_14_body_entered(body: Node2D) -> void:
	if body.is_in_group("players") and ani1:
		$AnimationPlayer.play("RESET") # Replace with function body.
		$Camera2D.followp2 = false
		Maxdistance = 9999999
		ani1 = false


func _on_area_2d_15_body_entered(body: Node2D) -> void:
	if body.is_in_group("players") and ani2:
		$AnimationPlayer.play("cage")
		$Camera2D.followp2 = true
		ani2 = false


func _on_area_2d_17_body_entered(body: Node2D) -> void:
		if body.is_in_group("players") and ani3:
			$AnimationPlayer.play("nowinn") # Replace with function body.
			$Camera2D.followp2 = false
			Maxdistance = 9999999
			ani3 = false


func _on_area_2d_18_body_entered(body: Node2D) -> void:
	if body.is_in_group("players") and not ani3:
		$AnimationPlayer.play("nowin2") # Replace with function body.
		ani4 = false
		print("thhe thingy2")
	print("thhe thingy")


func _on_area_2d_19_body_entered(body: Node2D) -> void:
		if body.is_in_group("players") and ani5 and not ani3:
			$AnimationPlayer.play("nowin3") # Replace with function body.
			ani5 = false # Replace with function body.


func _on_area_2d_20_body_entered(body: Node2D) -> void:
		if body.is_in_group("players") and ani6 and not ani3:
			$AnimationPlayer.play("nowin4") # Replace with function body.
			ani6 = false # Replace with function body. # Replace with function body.


func _on_area_2d_21_body_entered(body: Node2D) -> void:
		if body.is_in_group("players") and ani7 and not ani3:
			$AnimationPlayer.play("nowin5") # Replace with function body.
			ani7 = false # Replace with function body. # Replace with function body.
