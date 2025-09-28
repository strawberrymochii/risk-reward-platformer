extends CharacterBody2D

@onready var animated_sprite_2d: = $Sprite2D
@onready var respawn: = $"../respawn"

const SPEED = 900.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if position.y > 2000:
		respawn_point()
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("left"):
		print('left wor')

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
	
	var start_pos:Vector2
	start_pos = position 
func respawn_point():
	position = Vector2(0, -50)
	velocity = Vector2.ZERO
