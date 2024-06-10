extends Control

func _ready():
	Engine.time_scale = 1
	Global.fragmentsTaken = 0
	Global.nextScene = "levelOne"

func _on_Start_button_pressed():
	Global.transitionToScene(Global.nextScene)
	
func _on_Exit_button_pressed():
	get_tree().quit()

func _on_History_button_pressed():
	get_tree().change_scene("res://scenes/History.tscn")
