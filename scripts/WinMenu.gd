extends Control

func _ready():
	$Exit.grab_focus()


func _on_Exit_pressed():
	get_tree().quit()
