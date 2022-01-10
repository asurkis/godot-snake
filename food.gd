extends Area2D

export var step_scale = 24


var collisions: int = 0


func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if collisions > 0:
		var pick_from = get_viewport_rect().size / step_scale
		var x = randi() % int(pick_from.x)
		var y = randi() % int(pick_from.y)
		position = step_scale * Vector2(x + 0.5, y + 0.5)


func _on_Food_area_entered(_area):
	collisions += 1


func _on_Food_area_exited(_area):
	collisions -= 1
