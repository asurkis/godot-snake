extends Node

var next = null


func _ready():
	pass


#func _process(delta):
#	pass


func move_tail(parent_pos: Vector2):
	$Sprite.position = parent_pos
