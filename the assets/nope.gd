extends CharacterBody2D

@onready var nope: Sprite2D = $Sprite2D

const SPEED = 250.0
const JUMP_VELOCITY = -500.0

var time = 0.0
var was_running = false

func _physics_process(delta: float) -> void:
	time += delta
	var bounce = sin(time * 10) * 0.022
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("p1jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		var tween = create_tween()
		tween.tween_property(nope, "scale", Vector2(0.22, 0.28), 0.1)
		tween.parallel().tween_property(nope, "position", Vector2(0, 5), 0.1)
		tween.tween_property(nope, "scale", Vector2(0.2, 0.26), 0.15)
		tween.parallel().tween_property(nope, "position", Vector2(0, 0), 0.15)
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction != 0 and is_on_floor():
		nope.scale.x = 0.25 - bounce
		nope.scale.y = 0.25 + bounce
		was_running = true
		
	if was_running and (direction == 0 or not is_on_floor()):
		var tween = create_tween()
		tween.tween_property(nope, "scale", Vector2(0.25, 0.25), 0.1)
		was_running = false


	var was_on_floor_before = is_on_floor()
	move_and_slide()
	if not was_on_floor_before and is_on_floor():
		var tween = create_tween()
		tween.tween_property(nope, "scale", Vector2(0.28, 0.22), 0.1)
		tween.parallel().tween_property(nope, "position", Vector2(0, 5), 0.1)
		tween.tween_property(nope, "scale", Vector2(0.25, 0.25), 0.15)
		tween.parallel().tween_property(nope, "position", Vector2(0, 0), 0.15)
	
func respawn() -> void:
	global_position = GameData.checkpoint_position + Vector2(-40, 0)
	velocity = Vector2.ZERO
