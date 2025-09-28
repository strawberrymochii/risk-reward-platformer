extends CharacterBody2D

var max_health := 3
var current_health := max_health

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
	
