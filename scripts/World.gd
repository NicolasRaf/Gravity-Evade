extends Node2D

func _ready():
	Global.nextScene = "levelTwo"
	Global.currentScene = "res://scenes/World.tscn"
	Global.isTutorialRun = false
	Global.fragmentsMissing = 0
	Global.controlSlide = true
	#Caminho da cena atual e da que será rodada a seguir
	
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	#Contagem do número de fragmentos no level
	print("Num Frag: ", get_node("Fragments").get_child_count())
