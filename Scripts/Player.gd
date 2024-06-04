extends KinematicBody2D
class_name Player

onready var gravity_slider: VSlider = get_node("CanvasLayer/GravitySlider")
var direction : Vector2 = Vector2() # Vetor bidimensional,que inicialmente está em posição (0,0)
var jumpForce = 500

func _physics_process(delta):
	if gravity_slider.value == gravity_slider.max_value:
		$AnimatedSprite.flip_v = false
		
	if gravity_slider.value == gravity_slider.min_value:
		$AnimatedSprite.flip_v = true

	var gravity = gravity_slider.value	
	direction.x = 100
	
	if Input.is_action_pressed("jump") and is_on_floor():
		direction.y -= jumpForce
	else:
		direction.y += gravity * delta
		
	direction = move_and_slide(direction, Vector2.UP) 
	#Garante que o personagem não atravesse paredes e ande horizontalmente
	
