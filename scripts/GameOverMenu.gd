extends Control


func _on_Restart_pressed():
	Global.fragmentsTaken = 0
	get_tree().change_scene(Global.currentScene)

func _on_Exit_pressed():
	get_tree().quit()
