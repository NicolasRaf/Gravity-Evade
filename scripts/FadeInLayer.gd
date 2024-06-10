extends CanvasLayer

## PackedScene destino da transição
export var destiny_scene: PackedScene
var nextSceneString: String = ""
var progress: float = 0.0
onready var colorRect: ColorRect = $ColorRect

func _process(delta):
	progress = move_toward(progress, 1.0, 0.025)
	colorRect.color.a = progress
	if progress >= 1.0:
		if destiny_scene != null:
			print("Mudando para a cena: ", destiny_scene)
			get_tree().change_scene_to(destiny_scene)
		else:
			print("Erro: destiny_scene está null")
		Global.actualSceneKey = nextSceneString
		queue_free()
