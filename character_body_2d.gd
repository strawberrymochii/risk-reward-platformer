extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -900.0


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
	$Timer.start()

@onready var _animated_sprite = $AnimatedSprite2D
func _ready():
	_animated_sprite.play("right")
	
func _process(_delta):
	pass
	# Input.is_action_pressed("right"):
		#_animated_sprite.play("run")
	#else:
		#_animated_sprite.stop()
		
#func _on_timer_timeout() -> void:
	#$Timer.timeout.connect(_on_timer_timeout)
	#print("ok time over")

#func _process(delta):
	#if $CountdownTimer.time_left > 0:
		#$CountdownLabel.text = str(round($CountdownTimer.time_left))
	#else:
		#$CountdownLabel.text = "GO!"  # Or hide it
