extends Control

func _ready():
	# Definção da escala padrão de tempo e atribuição de variaveis globais de continuidade 
	Engine.time_scale = 1
	Global.fragmentsTaken = 0
	Global.nextScene = "tutorial"

# Chama a função global de transição de cena com fade e o caminho denido
func _on_Start_button_pressed():
	Global.transitionToScene(Global.nextScene)

# Sai do jogo
func _on_Exit_button_pressed():
	get_tree().quit()

# Troca a cena atual para a que contém a historia do jogo
func _on_History_button_pressed():
	get_tree().change_scene("res://scenes/History.tscn")

