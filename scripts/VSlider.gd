extends VSlider

onready var gravity_slider : VSlider = $"."
onready var seta : AnimatedSprite = $"../Seta"
onready var powerTimer : Timer = $"../PowerTimer"
onready var cooldownTimer : Timer = $"../CooldownTimer"
onready var timeSlow : Button = $"../TimeSlow"
var tween : Tween

# Incia a seta invisivel
func _ready():
	seta.visible = false
	

func _process(delta: float) -> void:
	# Atribui o valor do slider com base na conexão do Esplora e se é permitido seu controle
	if Global.esploraConnect and Global.controlSlide:
		# Atribuição do valor do slider ao que esta sendo enviado do Esplora
		value = EsploraInput.sliderValue 
	# Caso o player não deva mexer no slide é controlado sua usuabilidade
	elif ! Global.controlSlide:
		editable = false # Não pode mexer
	else:
		editable = true # Pode mexer
		
	# Controla a direção da seta com base no valor da gravidade
	if gravity_slider.value > 0:
		# Direção positiva, para baixo
		seta.visible = true
		seta.scale = Vector2(0.3,0.3)
	elif gravity_slider.value < 0:
		# Direção negativa, para cima
		seta.visible = true
		seta.scale = Vector2(-0.3,-0.3)
	
# Ao pressionar o botão é reduzida a escala de tempo e iniciado o tempo do poder
func _on_TimeSlow_pressed():
	Engine.time_scale = 0.4
	powerTimer.start()
	
# Volta os valores normais do fluxo de jogo ao acabar a duração do poder
func _on_PowerTimer_timeout():
	cooldownTimer.start() # Inicia o tempo de espera para usar o poder novamente
	Engine.time_scale = 1
	timeSlow.disabled = true

# Reativa a utilização do poder ao final do cooldown
func _on_CooldownTimer_timeout():
	timeSlow.disabled = false
