extends Node

var currentScene = ""
var nextScene = ""
var fragmentsTaken = 0
var fragmentsMissing = 0
var isDead: bool = false
var transition_scene: PackedScene = preload("res://scenes/FadeInLayer.tscn")
var actualSceneKey: String = ""

# Banco de dados de cenas
var scenes_database: Dictionary = {
	"main": preload("res://scenes/Main_Menu.tscn"),
	"levelOne": preload("res://scenes/World.tscn"),
	"levelTwo": preload("res://scenes/levelTwo.tscn"),  
	"levelThree": preload("res://scenes/levelThree.tscn"),  
	"transition": preload("res://scenes/Transition.tscn"),
	"win": preload("res://scenes/WinMenu.tscn"),
	"over": preload("res://scenes/Game_over_menu.tscn")  
}

# Função para transição de cena
func transitionToScene(destiny_scene: String) -> void:
	# Verifica se a cena de destino existe no dicionário
	if not scenes_database.has(destiny_scene):
		print("Erro: A cena '", destiny_scene, "' não existe no banco de dados.")
		return
	
	# Instancia a cena de transição
	var trans = transition_scene.instance()
	
	# Define a cena de destino
	trans.destiny_scene = scenes_database.get(destiny_scene)
	print("Cena de destino: ", trans.destiny_scene)
	
	# Atualiza a próxima cena global
	nextScene = destiny_scene
	trans.nextSceneString = destiny_scene
	
	# Adiciona a cena de transição ao nó atual
	get_tree().current_scene.add_child(trans)
	print("Transição iniciada para: ", nextScene)
