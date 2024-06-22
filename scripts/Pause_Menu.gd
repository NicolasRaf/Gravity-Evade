extends CanvasLayer

onready var ContinueBtn : Button = $ContinueBtn

func _ready():
	# Foca o botão de continue e garante que o pause não seja visível inicialmente
	ContinueBtn.grab_focus()
	visible = false

# Abri o menu de pause e pausa o fluxo normal
func _unhandled_input(event):
	# Verifica se o input para o pause foi pressionado
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		

# Fecha o menu de pause e volta ao fluxo normal
func _on_ContinueBtn_pressed():
	get_tree().paused = false
	visible = false
	
# Fecha o jogo
func _on_ExitBtn_pressed():
	get_tree().quit()
	
