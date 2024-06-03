extends Node

onready var transition_scene : PackedScene = preload("res://Scenes/FadeInTrasition.tscn")

#Função que transiciona as cenas
func transition_to_scene(destiny_scene: String) -> void:
	var trans = transition_scene.instantiate()
	trans.destiny_scene = destiny_scene
	add_child(trans)

## Cenas principais
var main_scenes := {
	"game" : preload("res://Scenes/World.tscn"),
	"main_menu" : preload("res://Scenes/Main_Menu.tscn")
}
