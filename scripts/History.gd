extends Control

onready var back_button = $Button as Button
func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Pause_Menu.tscn")
