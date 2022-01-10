extends CanvasLayer

signal new_game


func _ready():
	pass


func show():
	$Button.show()
	$Label.show()


func hide():
	$Button.hide()
	$Label.hide()


func update_score(score):
	$Label.text = "Score: %d" % score


func _on_Button_pressed():
	emit_signal("new_game")
