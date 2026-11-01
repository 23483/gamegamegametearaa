extends CharacterBody2D

@onready var p2: Sprite2D = $Watergirl

const SPEED = 250.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("p2jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("p2left", "p2right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var was_on_floor_before = is_on_floor()
	move_and_slide()
	if not was_on_floor_before and is_on_floor():
		var tween = create_tween()
		tween.tween_property(p2, "scale", Vector2(0.0875, 0.0525), 0.1)
		tween.tween_property(p2, "scale", Vector2(0.07, 0.07), 0.15)
		
		
		
		
func respawn() -> void:
	global_position = GameData.checkpoint_position + Vector2(40, 0)
	velocity = Vector2.ZERO
	await get_tree().physics_frame
	print("Position after physics: ", global_position)
