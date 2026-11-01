extends CharacterBody2D

@onready var p2: Sprite2D = $Watergirl

const SPEED = 250.0
const JUMP_VELOCITY = -500.0
var original_y = 0.0
var time = 0.0
var was_running = false
var was_idle = false

func _ready() -> void:
	original_y = p2.position.y


func _physics_process(delta: float) -> void:
	time += delta
	var bounce = sin(time * 10) * 0.005
	var breath = sin(time * 2) * abs(sin(time * 2)) * 0.0025
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("p2jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		var tween = create_tween()
		tween.tween_property(p2, "scale", Vector2(0.06, 0.08), 0.1)
		tween.tween_property(p2, "scale", Vector2(0.065, 0.075), 0.1)
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("p2left", "p2right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	if direction != 0 and is_on_floor():
		p2.scale.x = 0.07 - bounce
		p2.scale.y = 0.07 + bounce
		was_running = true
		
	if was_running and (direction == 0 or not is_on_floor()):
		var tween = create_tween()
		tween.tween_property(p2, "scale", Vector2(0.07, 0.07), 0.1)
		was_running = false
		
		
	if direction == 0 and is_on_floor():
		p2.scale.x = 0.07 + breath
		p2.scale.y = 0.07 - breath
		was_idle = true
	if was_idle and (direction != 0 or not is_on_floor()):
		var tween = create_tween()
		tween.tween_property(p2, "scale", Vector2(0.07, 0.07), 0.15)
		was_idle = false
		
		
	var was_on_floor_before = is_on_floor()
	move_and_slide()
	if not was_on_floor_before and is_on_floor():
		var tween = create_tween()
		tween.tween_property(p2, "scale", Vector2(0.0875, 0.0525), 0.1)
		tween.parallel().tween_property(p2, "position", Vector2(0, 5), 0.1)
		tween.tween_property(p2, "scale", Vector2(0.07, 0.07), 0.15)
		tween.parallel().tween_property(p2, "position", Vector2(0, 0), 0.15)
		
		
		
func respawn() -> void:
	global_position = GameData.checkpoint_position + Vector2(40, 0)
	velocity = Vector2.ZERO
	await get_tree().physics_frame
	print("Position after physics: ", global_position)
