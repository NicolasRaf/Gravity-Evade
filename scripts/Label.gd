extends Label

func _process(delta):
	text = str(Global.fragmentsTaken) + "/" + str(Global.fragmentsMissing)
