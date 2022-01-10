extends Node

var next = null


func _ready():
	pass


#func _process(delta):
#	pass


func move_tail(parent_pos: Vector2):
	if next != null:
		next.move_tail($Sprite.position)
	$Sprite.position = parent_pos


func expand(fragment):
	if next == null:
		next = fragment
		next.move_tail($Sprite.position)
		add_child(next)
	else:
		next.expand(fragment)
