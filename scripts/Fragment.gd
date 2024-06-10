extends Area2D

onready var pickupSound : AudioStreamPlayer2D = get_node("PickupSound")
onready var tween : Tween = Tween.new()

# Adiciona o Tween como um filho do nó ao iniciar
func _ready():
	add_child(tween)
	
# Função responsável por coletar o fragmento e aplicar seu SFX
func _on_Fragmento_body_entered(body):
	if body is Player:
		$CollisionShape2D.queue_free()
		Global.fragmentsTaken += 1
		pickupSound.play()
		print("Peguei fragmento")
		
		# Inicia a interpolação da escala para diminuir gradativamente
		tween.interpolate_property($Fragments, "scale", Vector2(0.4,0.4), Vector2(0, 0), 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
