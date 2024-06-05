extends Node

var currentScene = ""
var nextScene = ""
var fragmentsTaken = 0
var fragmentsMissing = 0


func transitionToScene() -> void:
	get_tree().change_scene(nextScene)
