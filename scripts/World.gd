extends Node2D
## Padronizado a todos os levels do jogo

# Atribui os valores de controle Global ao level atual
func _ready():
	Engine.time_scale = 1 # Garantia para que o tempo volte ao normal no restart
	Global.nextScene = "levelTwo" # Proxíma cena a ser rodada
	Global.currentScene = "res://scenes/World.tscn" # Caminho da cena atual
	Global.isTutorialRun = false # Desabilita a variável de tutorial
	Global.fragmentsTaken = 0 # Reseta o contador de fragmentos
	Global.controlSlide = true # Reatribui o contole do slider ao player
	
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	#Contagem do número de fragmentos no level
	
	print("Num Frag: ", get_node("Fragments").get_child_count())
