extends Node

var time_left = 10

func _ready() -> void:
	set_process(true)

func _process(delta: float) -> void:
	if time_left > 0:
		time_left -= delta
		if time_left < 0:
			time_left = 0
			set_process(false)
		$Label.text = "Time left: " + str(int(time_left))
	else:
		$Label.text = "Time's up!"
