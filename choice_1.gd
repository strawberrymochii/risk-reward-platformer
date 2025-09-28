extends Area2D

@onready var ui = get_node("$"."")  # Change this to your real path
@onready var speed_button = ui.get_node("$Panel/speed")
@onready var life_button = ui.get_node("$Panel/life")


func _ready():
	connect("body_entered", _on_body_entered)
	speed_button.pressed.connect(_on_speed_pressed)
	#life_button.pressed.connect(_on_life_pressed)

func _on_body_entered(body):
	if body.name == "Player":
		player = body
		ui.visible = true

func _on_speed_pressed():
	if player:
		player.speed += 200
	ui.visible = false
	queue_free()  # Remove power-up from world
	
func _on_life_pressed():
	if player:
		player.lives += 1
	#ui.visible = false
		 #queue_free()
