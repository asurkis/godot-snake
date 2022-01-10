extends Area2D

const Tail = preload("res://tail.tscn")

var direction: int = 0
var last_direction: int = 0
const DELTAS = [
	Vector2(1, 0),
	Vector2(0, -1),
	Vector2(-1, 0),
	Vector2(0, 1),
]


func _ready():
	for _i in range(20):
		$Tail.expand(Tail.instance())
	$MoveTimer.start()


func _process(_delta):
	if   last_direction != 2 && Input.is_action_pressed("ui_right"):
		direction = 0
	elif last_direction != 3 && Input.is_action_pressed("ui_up"):
		direction = 1
	elif last_direction != 0 && Input.is_action_pressed("ui_left"):
		direction = 2
	elif last_direction != 1 && Input.is_action_pressed("ui_down"):
		direction = 3
	rotation_degrees = 90 * direction


func _on_MoveTimer_timeout():
	$Tail.move_tail(position)
	position += 24 * DELTAS[direction]
	last_direction = direction


func _on_Head_area_entered(area):
	print(area, area.is_in_group("tail"))
