extends Control

onready var backButton = $Button as Button

func _ready():
	# Foca o botão de "Back"
	backButton.grab_focus()

func _on_Button_pressed():
	# Volta para a cena de menu principal
	get_tree().change_scene("res://scenes/Main_Menu.tscn")
