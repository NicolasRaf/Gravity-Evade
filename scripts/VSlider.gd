extends VSlider

onready var powerTimer : Timer = $"../PowerTimer"
onready var cooldownTimer : Timer = $"../CooldownTimer"
onready var timeSlow : Button = $"../TimeSlow"
var  tween : Tween

func _process(delta: float) -> void:
	if Global.esploraConnect and Global.controlSlide:
		value = EsploraInput.sliderValue 
	elif ! Global.controlSlide:
		editable = false
	else:
		editable = true
	
func _on_TimeSlow_pressed():
	Engine.time_scale = 0.4
	powerTimer.start()
	
	
func _on_PowerTimer_timeout():
	cooldownTimer.start()
	Engine.time_scale = 1
	timeSlow.disabled = true

func _on_CooldownTimer_timeout():
	timeSlow.disabled = false
