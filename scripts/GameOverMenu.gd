extends Control

onready var restart = $Restart

func _ready():
	Engine.time_scale = 1
	restart.grab_focus()
	
func _on_Restart_pressed():
	Global.fragmentsTaken = 0
	Global.isDead = false
	get_tree().change_scene(Global.currentScene)

func _on_Exit_pressed():
	get_tree().quit()
