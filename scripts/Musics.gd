extends Node

onready var musicPlayer = get_node("MusicPlayer")
var musicNum : int = 3

var musicDatabase : Dictionary = {
1: preload("res://assets/Songs/\'Defense Matrix\' by Vyra 🇧🇪 _ Retro Music (No Copyright) 📍 (128).mp3"),
2: preload("res://assets/Songs/🦾 Free Synthwave Music (For Videos) - _Voyager 1_ by John Tasoulas 🇬🇷 (128).mp3"),
3: preload("res://assets/Songs/Waterflame - Time Machine (256).mp3")
}

func _ready():
	musicPlayer.stream = musicDatabase.get(musicNum)
	playMusic()
	print(musicPlayer.stream)

func playMusic() -> void:
	musicPlayer.play()

func _on_MusicPlayer_finished():
	musicNum += 1
	musicPlayer.stream = musicDatabase.get(musicNum)
	playMusic()
	print(musicPlayer.stream)
	if musicNum == musicDatabase.size():
		musicNum = 1
