extends Node

var next = null


func _ready():
	pass


func move_tail(parent_pos: Vector2):
	if next != null:
		next.move_tail($Sprite.position)
	$Sprite.position = parent_pos


func expand(fragment):
	if next == null:
		next = fragment
		next.move_tail($Sprite.position)
		call_deferred("add_child", next)
	else:
		next.expand(fragment)


func drop(length):
	if length == 0:
		remove_child(next)
		next = null
	else:
		next.drop(length - 1)
