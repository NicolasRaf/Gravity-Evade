extends KinematicBody2D
class_name Player

onready var animatedSprite: AnimatedSprite = get_node("AnimatedSprite")
onready var gravitySlider : VSlider = get_node("PlayerHud/GravitySlider")
var direction : Vector2 = Vector2() # Vetor bidimensional,que inicialmente está em posição (0,0)

func _physics_process(delta):
	if Global.isDead:
		animatedSprite.play("hit")
	else:
		
		# Altera a escala do player com base no valor do slider
		if gravitySlider.value < 0:
			animatedSprite.flip_v = true
			animatedSprite.play("run")
		else:
			animatedSprite.play("run")
			animatedSprite.flip_v = false
			if !is_on_floor():
				animatedSprite.play("fall")
			

		if gravitySlider.value < 0:
			$CollisionShape2D.position.y = $AnimatedSprite.position.y 
		
		# Igual o valor da gravidade que afeta o player ao valor do sldier
		var gravity = gravitySlider.value
		direction.x = 120
		
		direction.y += gravity * delta
			
		direction = move_and_slide(direction, Vector2.UP) 
		#Garante que o personagem não atravesse paredes e ande horizontalmente


func _on_AnimatedSprite_animation_finished():
	if animatedSprite.get_animation() == "hit":
		queue_free()
		get_tree().change_scene("res://scenes/Game_over_menu.tscn")
