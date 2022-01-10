extends Sprite

var direction: int = 0
const DELTAS = [
	Vector2(1, 0),
	Vector2(0, -1),
	Vector2(-1, 0),
	Vector2(0, 1),
]


func _ready():
	$MoveTimer.start()


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		direction = 0
	elif Input.is_action_pressed("ui_up"):
		direction = 1
	elif Input.is_action_pressed("ui_left"):
		direction = 2
	elif Input.is_action_pressed("ui_down"):
		direction = 3
	rotation_degrees = 90 * direction


func _on_MoveTimer_timeout():
	$Tail.move_tail(position)
	position += 10 * DELTAS[direction]
