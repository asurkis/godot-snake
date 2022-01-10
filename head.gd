extends Area2D

export var step_scale = 24

signal died
signal ate(food)

const Tail = preload("res://tail.tscn")

const DELTAS = [
	Vector2(1, 0),
	Vector2(0, -1),
	Vector2(-1, 0),
	Vector2(0, 1),
]

var direction: int = 0
var last_direction: int = 0


func _ready():
	monitoring = false
	for _i in range(20):
		$Tail.expand(Tail.instance())


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


func expand(fragment):
	$Tail.expand(fragment)


func step_forward():
	$Tail.move_tail(position)
	position += step_scale * DELTAS[direction]
	last_direction = direction
	monitoring = true


func _on_Head_area_entered(area):
	if area.is_in_group("tail"):
		emit_signal("died")
	elif area.is_in_group("food"):
		emit_signal("ate", area)
