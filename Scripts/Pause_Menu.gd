extends CanvasLayer

onready var ContinueBtn : Button = $ContinueBtn

func _ready():
	visible = false
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = !visible
		get_tree().paused = visible
		ContinueBtn.grab_focus()


func _on_ContinueBtn_pressed():
	get_tree().paused = false
	visible = false
	
func _on_ExitBtn_pressed():
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
