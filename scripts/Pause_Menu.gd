extends CanvasLayer

onready var ContinueBtn : Button = $ContinueBtn

func _ready():
	visible = false
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = !visible
		Engine.time_scale = 0
		ContinueBtn.grab_focus()


func _on_ContinueBtn_pressed():
	Engine.time_scale = 1
	visible = false
	get_tree().paused = false
	
func _on_ExitBtn_pressed():
	get_tree().change_scene("res://scenes/Main_Menu.tscn")
