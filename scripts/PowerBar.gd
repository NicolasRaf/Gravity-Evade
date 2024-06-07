extends ProgressBar

onready var cooldownTimer = $"../CooldownTimer"



func _process(delta):
		if cooldownTimer.is_stopped():
			var _diff = abs(cooldownTimer.wait_time - value)
			var _sp = _diff / 10;
			if value < cooldownTimer.wait_time:
				value += _sp;
		else:
			value = cooldownTimer.time_left
