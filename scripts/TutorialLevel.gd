extends Node2D

onready var player = get_node("Player")
onready var comands = get_node("Comands")
onready var fragment = get_node("Fragments/Fragment")
onready var skip = get_node("skip")
var tween : Tween = Tween.new()


func _ready():
	add_child(tween)
	
	Global.controlSlide = false
	
	player.position = Vector2(68,-19.5760)
	comands.rect_position.x = 4
	
	fragment.visible = false
	fragment.monitoring = false
	
	Global.nextScene = "levelOne"
	Global.currentScene = "res://scenes/TutorialLevel.tscn"
	#Caminho da cena atual e da que será rodada a seguir

	tween.interpolate_property(skip, "self_modulate", Color(255,255,255,1),  Color(255,255,255,0), 4, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	Global.isTutorialRun = true

func _process(delta):
	
	Global.fragmentsMissing = get_node("Fragments").get_child_count()
	# Contagem do número de fragmentos no level
		
	if player.position.y >= -19.576 and Global.fragmentsTaken != 1:
		yield(get_tree().create_timer(5), "timeout")
		comands.text = "First of all try to go to the ceiling, \n Raise the slider!"
		Global.controlSlide = true
		
	if player.position.y <= -144 and Global.fragmentsTaken != 1:
		fragment.visible = true
		fragment.monitoring = true
		comands.text = "You're getting the hang of it! \n A fragment has appeared, take it!!!"
		
	if Global.fragmentsTaken == 1 and player.position.x <= 68:
		Global.controlSlide = false
		comands.text = "Collect all the fragments in the level \n to complete it"
		yield(get_tree().create_timer(5), "timeout")
		comands.text = "Now run to the end of the stage, \n a portal awaits you there!"
		yield(get_tree().create_timer(5), "timeout")
		comands.text = ""
		yield(get_tree().create_timer(1), "timeout")
		comands.text = "Obstacles, watch out! \n Control gravity precisely to pass."
		Global.isTutorialRun = false

	if player.position.x >= 480:
		Global.isTutorialRun = true
		comands.visible = true
		comands.rect_position.x = 288
		yield(get_tree().create_timer(7), "timeout")
		comands.text = "Use your time control by pressing the \n right button to slow down time! Good Luck!"
		Global.controlSlide = true
		yield(get_tree().create_timer(5), "timeout")
		Global.isTutorialRun = false


func _on_SkipButton_pressed() -> void:
	Global.transitionToScene(Global.nextScene)
