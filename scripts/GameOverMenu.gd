extends Control

onready var restart = $Restart

func _ready():
	# Volta a escala de tempo ao normal e foca os botões
	Engine.time_scale = 1
	restart.grab_focus()
	
func _on_Restart_pressed():
	# Reinicia as variaveis Globais
	Global.fragmentsTaken = 0
	Global.isDead = false
	
	# Volta para a cena em que o player morreu
	get_tree().change_scene(Global.currentScene)

func _on_Exit_pressed():
	# Fecha o jogo
	get_tree().quit() 
