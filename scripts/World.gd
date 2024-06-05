extends Node2D

func _ready():
	Global.nextScene = "res://scenes/levelTwo.tscn"
	Global.currentScene = "res://scenes/World.tscn"
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	print("Num Frag: ", get_node("Fragments").get_child_count())
