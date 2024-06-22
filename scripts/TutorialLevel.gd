extends Node2D

onready var player : KinematicBody2D = get_node("Player")
onready var comands : Label = get_node("Comands")
onready var fragment : Area2D = get_node("Fragments/Fragment")
onready var skip  : Label = get_node("skip")
var tween : Tween = Tween.new()


func _ready():
	# Adiciona o Tween como um filho do nó ao iniciar
	add_child(tween)
	
	# Atribui as variaveis de controle na Global para estado de tutorial
	Global.controlSlide = false # Define se o player pode controlar o slider
	Global.isTutorialRun = true # Controla se o movimento de corrida do player
	Global.nextScene = "levelOne"  #Caminho da cena que será rodada a seguir
	Global.currentScene = "res://scenes/TutorialLevel.tscn" #Caminho da cena atual
	
	# Define a posição inicial do player e do label de comandos 
	player.position = Vector2(68,-19.5760)
	comands.rect_position.x = 4
	
	# Controle do fragmento usado no tutorial
	fragment.visible = false
	fragment.monitoring = false
	
	# Configutação e inicio do Tween utilizado para esmaecer a mensagem de "skip"
	tween.interpolate_property(skip, "self_modulate", Color(0,0,0,1),  Color(0,0,0,0), 4, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(get_tree().create_timer(2),"timeout")
	tween.start()

func _process(delta):
	# Contagem do número de fragmentos no level	
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	
	# Todas mensagens são motradas com base ao menos na posição do player
		
	# Mensagem incial antes da coleta do fragmento
	if player.position.y >= -19.576 and Global.fragmentsTaken != 1:
		yield(get_tree().create_timer(5), "timeout")
		comands.text = "First of all try to go to the ceiling, \n Raise the slider!"
		Global.controlSlide = true
	
	# Mensagem após o usuário movimentar o player para o teto
	if player.position.y <= -144 and Global.fragmentsTaken != 1:
		# Aparição do fragmento para o player coletar
		fragment.visible = true 
		fragment.monitoring = true
		comands.text = "You're getting the hang of it! \n A fragment has appeared, take it!!!"
	
	# Mensagens após a coleta do fragemnto, iniciando o movimento do player
	if Global.fragmentsTaken == 1 and player.position.x <= 68:
		Global.controlSlide = false
		comands.text = "Collect all the fragments in the level \n to complete it"
		yield(get_tree().create_timer(5), "timeout") # Timer para leitura
		comands.text = "Now run to the end of the stage, \n a portal awaits you there!"
		yield(get_tree().create_timer(5), "timeout") # Timer para leitura
		comands.visible = false
		comands.text = "Obstacles, watch out! \n Control gravity precisely to pass."
		Global.isTutorialRun = false
	
	# Mensagem ao se aproximar dos primeiros obstaculos
	if player.position.x >= 480:
		Global.isTutorialRun = true
		comands.visible = true
		comands.rect_position.x = 288
		yield(get_tree().create_timer(7), "timeout") # Timer para leitura
		# Ensinado o uso do time slow 
		comands.text = "Control the time using the \n right button(space). \n Good Luck!"
		Global.controlSlide = true
		yield(get_tree().create_timer(8), "timeout") # Timer para leitura
		Global.isTutorialRun = false

# Pula o tutorial ao ser pressionado o atalho de "skip"
func _on_SkipButton_pressed() -> void:
	Global.transitionToScene(Global.nextScene)
