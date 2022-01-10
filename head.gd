extends Area2D

export var step_scale = 24

signal died
signal ate(food)

const Tail = preload("res://tail.tscn")

const DX = [1, 0, -1, 0]
const DY = [0, 1, 0, -1]

var direction: int = 0
var last_direction: int = 0


func _process(_delta):
	if   last_direction != 2 && Input.is_action_pressed("ui_right"):
		direction = 0
	elif last_direction != 3 && Input.is_action_pressed("ui_down"):
		direction = 1
	elif last_direction != 0 && Input.is_action_pressed("ui_left"):
		direction = 2
	elif last_direction != 1 && Input.is_action_pressed("ui_up"):
		direction = 3
	rotation_degrees = 90 * direction


func new_game():
	monitoring = false


func expand(fragment):
	$Tail.expand(fragment)


func step_forward():
	$Tail.move_tail(position)
	var bounds = get_viewport_rect().size / step_scale
	var max_x = int(bounds.x)
	var max_y = int(bounds.y)
	var x = int(position.x / step_scale)
	var y = int(position.y / step_scale)
	x += DX[direction]
	y += DY[direction]
	x = (x + max_x) % max_x
	y = (y + max_y) % max_y
	position = step_scale * Vector2(x + 0.5, y + 0.5)

	last_direction = direction
	monitoring = true


func _on_Head_area_entered(area):
	if area.is_in_group("tail"):
		emit_signal("died")
	elif area.is_in_group("food"):
		emit_signal("ate", area)
