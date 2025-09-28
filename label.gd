extends Label

@onready var timer: Timer = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time_left = int(timer.time_left)
	text = str(time_left)
