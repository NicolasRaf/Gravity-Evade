extends Control
class_name MainMenu


var start_button = $Start_button as Button
var exit_Button = $Exit_button as Button
var start_level = preload("res://Scenes/World.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed())
	exit_Button.button_down.connect(on_exit_pressed())
	start_button.grab_focus()
	
func on_start_pressed() -> void:
	Global.transition_to_scene("game")
	
func on_exit_pressed() -> void:
	get_tree().quit()
