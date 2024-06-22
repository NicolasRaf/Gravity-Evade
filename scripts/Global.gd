extends Node

var controlSlide : bool = true
var isTutorialRun : bool = false
var esploraConnect : bool = false
var is_button_pressed : bool = false
var currentScene : String = ""
var nextScene : String = ""
var fragmentsTaken : int = 0
var fragmentsMissing : int = 0
var isDead: bool = false
var transition_scene: PackedScene = preload("res://scenes/FadeInLayer.tscn")
var actualSceneKey: String = ""

# Banco de dados de cenas
var scenes_database: Dictionary = {
	"main": preload("res://scenes/Main_Menu.tscn"),
	"tutorial": preload("res://scenes/TutorialLevel.tscn"),
	"levelOne": preload("res://scenes/World.tscn"),
	"levelTwo": preload("res://scenes/levelTwo.tscn"),  
	"levelThree": preload("res://scenes/levelThree.tscn"),  
	"transition": preload("res://scenes/Transition.tscn"),
	"win": preload("res://scenes/WinMenu.tscn"),
	"over": preload("res://scenes/Game_over_menu.tscn")  
}

func _process(delta):
	# Verifica se houve movimento  no eixo Y do analogico
	if EsploraInput.analogY > 155 or EsploraInput.analogY < 150 and esploraConnect:
		analogicInput() # Chama a função responsavel por simula o input do analogico
		
		# Delay na verificação do input 
		set_process(false)
		yield(get_tree().create_timer(0.134),"timeout")
		set_process(true)

	# Simula o input de confirmção(Enter) a parti do valor do botão do Esplora
	if EsploraInput.interactButton == 0 and esploraConnect:
		var event = InputEventAction.new() # Variavel que sera configurada como input
		event.action = "ui_accept" # Ação que sera simulada 
		event.pressed = true  # Configura ação como um botão pressionado
		get_tree().input_event(event) # Manda o evento de input configurado para o fluxo
	
	# Simula o input criado de skip(enter) a parti do valor do botão do Esplora
	if EsploraInput.pauseButton == 0 and esploraConnect:
		var event = InputEventAction.new()
		event.action = "skip"
		event.pressed = true
		get_tree().input_event(event)
	
	# Simula o input criado de interact(space) a parti do valor do botão do Esplora
	if EsploraInput.powerButton == 0 and esploraConnect:
		var event = InputEventAction.new()
		event.action = "interact"	
		event.pressed = true
		get_tree().input_event(event)

# Função responsavel por simular o movimento feito no eixo y do análogico
func analogicInput():
	# Se o valor do analogico utrapassarem os valores de verificação é simulado o input respectivo 
	if EsploraInput.analogY > 500:
		var event = InputEventAction.new()
		event.action = "ui_down"
		event.pressed = true
		get_tree().input_event(event)
	elif EsploraInput.analogY < -500:
		var event = InputEventAction.new()
		event.action = "ui_up"
		event.pressed = true
		get_tree().input_event(event)


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
	

