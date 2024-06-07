extends Area2D

# Função responsável por matar o player e chmamar a cena de game over
func _on_KillZone_body_entered(body):
	if body is Player: # Reconhce se o corpo que entrou em contato é o player
		body.queue_free()
		get_tree().change_scene("res://scenes/Game_over_menu.tscn")
