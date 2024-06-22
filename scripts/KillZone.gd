extends Area2D
signal death

onready var DeathSound: AudioStreamPlayer2D = get_node("DeathSound")

# Função responsável por matar o player
func _on_KillZone_body_entered(body):
	
	if body is Player: # Reconhce se o corpo que entrou em contato é o player e inici
		DeathSound.play() # SFX de morte 
		Global.isDead = true # Atribuição responsavel por matar o player pela Global
