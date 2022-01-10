extends Node

const Food = preload("res://food.tscn")


func _ready():
	for i in range(20):
		var inst = Food.instance()
		inst.position = Vector2(24 * i, 0)
		add_child(inst)


#func _process(delta):
#	pass
