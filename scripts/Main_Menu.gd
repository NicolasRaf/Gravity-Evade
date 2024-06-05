extends Control

func _on_Start_button_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")
	
func _on_Exit_button_pressed():
	get_tree().quit()
