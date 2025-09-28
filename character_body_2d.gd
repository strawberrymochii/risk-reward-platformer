extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

const SPEED = 900.0
const JUMP_VELOCITY = -900.0


func _process(_delta):
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		_animated_sprite.play("walk")
	else:
		_animated_sprite.play("idle")
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
