extends VSlider

onready var powerTimer = $"../PowerTimer"

func _on_TimeSlow_pressed():
	Engine.time_scale = 0.5
	powerTimer.start()
	
func _on_PowerTimer_timeout():
	Engine.time_scale = 1
