extends Label

onready var powerBar : ProgressBar = $"../PowerBar"
var tween : Tween = Tween.new()

func _ready() -> void:
	add_child(tween)
	rect_rotation = 5

func _process(delta) -> void:
	# Controla a visibilidade do label com base no valor máximo da progressbar
	if powerBar.value != 4.96:
		visible = false
	else:
		visible = true
		
	if rect_rotation == 5:
		tween.interpolate_property(self, "rect_rotation", 5, -5, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
	elif rect_rotation == -5:
		tween.interpolate_property(self, "rect_rotation", -5, 5, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
