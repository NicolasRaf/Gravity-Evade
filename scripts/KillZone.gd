extends Area2D
signal death

onready var DeathSound: AudioStreamPlayer2D = get_node("DeathSound")

# Função responsável por matar o player e chmamar a cena de game over
func _on_KillZone_body_entered(body):
	if body is Player: # Reconhce se o corpo que entrou em contato é o player
		DeathSound.play()
		Global.isDead = true
