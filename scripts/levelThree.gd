extends Node2D

# Atribui nas variaveis Globais os valores padrões desse level 
func _ready():
	Engine.time_scale = 1
	Global.nextScene = "win"
	Global.currentScene = "res://scenes/levelThree.tscn"
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	Global.fragmentsTaken = 0
