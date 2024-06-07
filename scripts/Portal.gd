extends Area2D

func _on_Area2D_body_entered(body):
	if body is Player and Global.fragmentsTaken >= Global.fragmentsMissing:
		Global.transitionToScene()
	else:
		get_tree().change_scene("res://scenes/Game_over_menu.tscn")
