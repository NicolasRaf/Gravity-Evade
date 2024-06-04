extends Area2D

func _on_Fragmento_body_entered(body):
	if body is Player:
		Global.fragmentsTaken += 1
		
		print("Peguei fragmento")
		
