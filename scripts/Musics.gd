extends Node

onready var musicPlayer = get_node("MusicPlayer")
var musicNum : int = 1

var musicDatabase : Dictionary = {
1: preload("res://assets/Songs/\'Defense Matrix\' by Vyra 🇧🇪 _ Retro Music (No Copyright) 📍 (128).mp3"),
2: preload("res://assets/Songs/Sci-Fi Robot Power Down Sound Effect (128).mp3"),
3: preload("res://assets/Songs/💊 Psychedelic & Techno (Free Music) - _RECALL_ by Glitch 🇵🇱 (128).mp3")
}

func _ready():
	musicPlayer.stream = musicDatabase.get(musicNum)
	musicPlayer.play()


func _on_MusicPlayer_finished():
	musicPlayer.stream = musicDatabase.get(musicNum)
	musicNum += 1
	if musicNum == 3:
		musicNum = 1
