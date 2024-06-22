extends Node2D

# Atribui nas variaveis Globais os valores padrões desse level 
func _ready():
	Engine.time_scale = 1
	Global.nextScene = "levelThree"
	Global.currentScene = "res://scenes/levelTwo.tscn"
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	Global.fragmentsTaken = 0
