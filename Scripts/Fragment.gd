extends Area2D

onready var pickupSound : AudioStreamPlayer2D = get_node("PickupSound")
onready var timerQueue : Timer = get_node("TimerQueue")

# Função responsavel por coletar o fragmento e aplicar seu SFX
func _on_Fragmento_body_entered(body):
	if body is Player:
		Global.fragmentsTaken += 1
		pickupSound.play()
		timerQueue.start()
	
func _on_TimerQueue_timeout():
		queue_free()
		print("Peguei fragmento")
