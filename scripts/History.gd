extends Control

onready var backButton = $Button as Button

func _ready():
	backButton.grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Main_Menu.tscn")
