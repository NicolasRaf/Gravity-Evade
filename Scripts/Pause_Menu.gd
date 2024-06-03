extends CanvasLayer

onready var continue_btn : Button = $Menu/continue_btn

func _ready():
	visible = false
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and Global.can_pause:
		visible = !visible
		get_tree().paused = visible
		continue_btn.grab_focus()
		

