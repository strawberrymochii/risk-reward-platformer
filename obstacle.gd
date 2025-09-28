extends Area2D

var damage := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
