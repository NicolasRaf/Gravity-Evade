extends TextureProgress
## Segue o mesmo modelo da "PowerBar", mas com estilos personalizados 

onready var cooldownTimer : Timer = $"../CooldownTimer"

func _process(delta):
		# Restaura a barra de poder ao final do Cooldown
		if cooldownTimer.is_stopped():
			# Variaveis para atribuição crescente do valor da barra
			var _diff = abs(cooldownTimer.wait_time - value)
			var _sp = _diff / 10;
			
			# Quando o valor for menor que o cooldown o valor da barra é somado
			if value < cooldownTimer.wait_time:
				value += _sp;
		else:
			# Se o timer de Cooldown não estiver parado o valor é igualado ao tempo restante
			value = cooldownTimer.time_left
