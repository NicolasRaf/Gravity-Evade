extends Node2D


func _ready():
	Global.nextScene = "levelThree"
	Global.currentScene = "res://scenes/levelTwo.tscn"
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	Global.fragmentsTaken = 0
