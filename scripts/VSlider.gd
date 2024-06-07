extends VSlider

onready var powerTimer : Timer = $"../PowerTimer"
onready var cooldownTimer : Timer = $"../CooldownTimer"
onready var timeSlow : Button = $"../TimeSlow"


func _on_TimeSlow_pressed():
	Engine.time_scale = 0.5
	powerTimer.start()
	
func _on_PowerTimer_timeout():
	cooldownTimer.start()
	Engine.time_scale = 1
	timeSlow.disabled = true

func _on_CooldownTimer_timeout():
	timeSlow.disabled = false
