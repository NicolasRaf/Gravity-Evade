extends KinematicBody2D
class_name Player

onready var animatedSprite: AnimatedSprite = get_node("AnimatedSprite")
onready var gravitySlider : VSlider = get_node("PlayerHud/GravitySlider")

var direction : Vector2 = Vector2() # Vetor bidimensional,que inicialmente está em posição (0,0)
var speed : int = 120
var idleAnimation : String = ""

func _physics_process(delta):
	
	# Controle das animações e movimento do player caso esteja no tutorial
	if Global.isTutorialRun:
		idleAnimation = "idle"
		direction.x = 0
	else:
		idleAnimation = "run"
		direction.x = speed
	
	# Controle das animações normais do player(em jogo) 
	if Global.isDead:
		# Incia a animação de morte como maior na hierarquia 
		animatedSprite.play("hit")
	else:
		# Altera flip vertical com base no valor do slider
		if gravitySlider.value < 0:
			# Em caso negativo o player é rotacionado
			animatedSprite.flip_v = true
			animatedSprite.play(idleAnimation)
		else:
			# Em caso positivo é mantido a animação padrão de "run"
			animatedSprite.play(idleAnimation)
			animatedSprite.flip_v = false
			if !is_on_floor():
				# Se o player não estiver no solo é iniciado a animação de queda
				animatedSprite.play("fall")
		
		# Ajusta a posição do colisor com base no valor do slider
		if gravitySlider.value < 0:
			# Atribui a mesma posição da sprite do robô
			$CollisionShape2D.position.y = $AnimatedSprite.position.y
		else:
			# Atribui a posição do sprite somado a 2 para paraer seus eixos
			$CollisionShape2D.position.y = $AnimatedSprite.position.y + 2
		
		# Iguala o valor da gravidade que afeta o player ao valor do sldier
		var gravity = gravitySlider.value
		
		# Defini a direção no eixo Y do player baseado na gravidade
		direction.y += gravity * delta
			
		#Garante que o personagem não atravesse paredes e ande horizontalmente
		direction = move_and_slide(direction, Vector2.UP) 

# Ao finaizar a animação de dano, única que não está em loop, elimina o player e leva ao "Game Over"
func _on_AnimatedSprite_animation_finished():
	# Verificação para confirma a animação de dano
	if animatedSprite.get_animation() == "hit":
		queue_free() 
		get_tree().change_scene("res://scenes/Game_over_menu.tscn")
