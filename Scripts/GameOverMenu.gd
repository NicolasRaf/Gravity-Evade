extends Control


func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")

func _on_Exit_pressed():
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
