extends Sprite

var direction: int = 0
const DELTAS = [
	Vector2(1, 0),
	Vector2(0, -1),
	Vector2(-1, 0),
	Vector2(0, 1),
]


# Called when the node enters the scene tree for the first time.
func _ready():
	$MoveTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		direction = 0
	elif Input.is_action_pressed("ui_up"):
		direction = 1
	elif Input.is_action_pressed("ui_left"):
		direction = 2
	elif Input.is_action_pressed("ui_down"):
		direction = 3


func _on_MoveTimer_timeout():
	position += 10 * DELTAS[direction]
