extends Control

onready var continue_button = $Start as Button

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")
