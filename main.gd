extends Node

export var food_amount = 20

const Food = preload("res://food.tscn")
const Tail = preload("res://tail.tscn")


func _ready():
	new_game()


func new_game():
	for _i in range(food_amount):
		add_child(Food.instance())


func game_over():
	pass


func _on_GameTimer_timeout():
	$Head.step_forward()
	pass # Replace with function body.


func _on_Head_ate(food):
	$Head.expand(Tail.instance())
