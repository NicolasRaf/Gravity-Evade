extends Node2D
#TODO: Cena nescessitando integração ao teleporte e melhoria no visual

func _ready():
	$Timer.start()  # Certifique-se de que há um Timer na cena com sinal conectado ao método _on_timer_timeout

func _on_Timer_timeout():
	print("Timer timeout, chamando transitionToScene para: ", Global.nextScene)
	Global.transitionToScene(Global.nextScene)


func _process(delta):
	var _pointsNumber = ((OS.get_ticks_msec() / 500) % 3) + 1
	$CanvasLayer/Label.text = "[center][wave]TELEPORTANDO" + str(".").repeat(_pointsNumber)


