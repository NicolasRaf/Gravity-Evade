extends KinematicBody2D
class_name Player
onready var animatedSprite: AnimatedSprite = get_node("AnimatedSprite")
onready var powerTimer: Timer = get_node("PowerTimer")
onready var button : Button = get_node("PlayerHud/TimeSlow")
onready var gravitySlider : VSlider = get_node("PlayerHud/GravitySlider")
var direction : Vector2 = Vector2() # Vetor bidimensional,que inicialmente está em posição (0,0)
var jumpForce : int = 500

func _physics_process(delta):
	
	# Altera a escala do player com base no valor do slider
	if gravitySlider.value < 0:
		animatedSprite.flip_v = true
		animatedSprite.scale.x = 0.5
	else:
		animatedSprite.flip_v = false
		

	if gravitySlider.value < 0:
		$CollisionShape2D.position.y = -44
	else:
		$CollisionShape2D.position.y = $AnimatedSprite.position.y + 13
	
	# Controla o flip.H para evitar que o player fique flipado ao mudar a escala pra negativa
#	if gravitySlider.value < 0:
#		$AnimatedSprite.flip_h = true
#	else:
#		$AnimatedSprite.flip_h = false
	
	# Igual o valor da gravidade que afeta o player ao valor do sldier
	var gravity = gravitySlider.value
	direction.x = 100
	
	if Input.is_action_pressed("jump") and is_on_floor():
		direction.y -= jumpForce
	else:
		direction.y += gravity * delta
		
	direction = move_and_slide(direction, Vector2.UP) 
	#Garante que o personagem não atravesse paredes e ande horizontalmente

func _on_TimeSlow_pressed():
	Engine.time_scale = 0.5
	powerTimer.start()


func _on_PowerTimer_timeout():
	Engine.time_scale = 1
	
