extends Control

func _ready():
	Global.fragmentsTaken = 0

func _on_Start_button_pressed():
	get_tree().change_scene("res://scenes/World.tscn")
	
func _on_Exit_button_pressed():
	get_tree().quit()

func _on_History_button_pressed():
	get_tree().change_scene("res://scenes/History.tscn")
