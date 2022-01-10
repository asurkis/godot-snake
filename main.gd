extends Node

export var food_amount = 20

const Food = preload("res://food.tscn")
const Tail = preload("res://tail.tscn")
var score: int


func _ready():
	for _i in range(food_amount):
		add_child(Food.instance())


func new_game():
	score = 0
	$Head.new_game()
	$GameTimer.start()
	$HUD.hide()


func game_over():
	$GameTimer.stop()
	$HUD.show()


func _on_GameTimer_timeout():
	$Head.step_forward()
	pass # Replace with function body.


func _on_Head_ate(_food):
	score += 1
	$HUD.update_score(score)
	$Head.expand(Tail.instance())
