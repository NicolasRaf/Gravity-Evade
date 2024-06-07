extends Area2D

func _on_KillZone_body_entered(body):
	if body is Player:
		pass
#		body.queue_free()
#		get_tree().change_scene("res://scenes/Game_over_menu.tscn")
