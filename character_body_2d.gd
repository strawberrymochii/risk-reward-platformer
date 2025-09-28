extends CharacterBody2D

@onready var animated_sprite_2d: = $Sprite2D
@onready var respawn: = $"../respawn"

var speed = 900.0
var JUMP_VELOCITY = -400.0
var max_health := 3
var current_health := max_health

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	var start_pos:Vector2
	start_pos = position
	
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
		velocity.x = direction * speed
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		

	move_and_slide()
	
	 
func respawn_point():
	position = Vector2(0, -50)
	velocity = Vector2.ZERO
	
func speed_button():
	if animated_sprite_2d:
		animated_sprite_2d.speed += 200
		#ui.visible = false
		queue_free()  # <- removes the power-up from the world

func life_buttton():
	if animated_sprite_2d:
		animated_sprite_2d.lives += 1
		#ui.visible = false
		queue_free()
		
func _ready():
	update_health_display()
	
func take_damage(amount: int):
	current_health -= amount
	if current_health <= 0:
		current_health = 0
		die()
		update_health_display
func update_health_display():
	print("Health: ", current_health)
func die():
	print("Game Over!")
