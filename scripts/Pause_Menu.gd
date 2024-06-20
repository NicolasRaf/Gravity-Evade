extends CanvasLayer

onready var ContinueBtn : Button = $ContinueBtn

func _ready():
	ContinueBtn.grab_focus()
	visible = false
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		


func _on_ContinueBtn_pressed():
	get_tree().paused = false
	visible = false
	
	
func _on_ExitBtn_pressed():
	get_tree().quit()
	
