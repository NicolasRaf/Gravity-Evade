extends Label

# Label que verifica os fragmentos coletados em relação aos faltantes
func _process(delta):
	text = str(Global.fragmentsTaken) + "/" + str(Global.fragmentsMissing)
