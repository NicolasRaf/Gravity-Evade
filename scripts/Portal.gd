extends Area2D

# Contorla o teleporte do player entre as fases 
func _on_Area2D_body_entered(body):
	# Fiscaliza se todos os fragmentos foram coletados e se é o player colidindo
	if body is Player and Global.fragmentsTaken >= Global.fragmentsMissing:
		# Chama função de teletransporte para o proxímo level
		Global.transitionToScene(Global.nextScene)
	else:
		# O player é levado ao "Game Over" ao não coletar todos fragmentos
		Global.transitionToScene("over")
