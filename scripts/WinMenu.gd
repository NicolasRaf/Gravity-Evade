extends Control

# Foca o botão "Exit"
func _ready():
	$Exit.grab_focus()

# Fecha o jogo
func _on_Exit_pressed():
	get_tree().quit()
