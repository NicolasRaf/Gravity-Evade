extends Node

onready var musicPlayer : AudioStreamPlayer = get_node("MusicPlayer")
var musicNum : int = 1 # Índice referente a cada musica da playlist

# Banco de dados das musicas(Playlist)
var musicDatabase : Dictionary = {
1: preload("res://assets/Songs/\'Defense Matrix\' by Vyra 🇧🇪 _ Retro Music (No Copyright) 📍 (128).mp3"),
2:preload("res://assets/Songs/🦾 Free Synthwave Music (For Videos) - _Voyager 1_ by John Tasoulas 🇬🇷 (128).mp3"),
3:preload("res://assets/Songs/Waterflame - Time Machine (256).mp3")
}

# Inicia a musica de fundo com o indice inicial
func _ready():
	musicPlayer.stream = musicDatabase.get(musicNum) # Seleciona a musica da playlist com base no índice
	playMusic()
	print(musicPlayer.stream)

# Função de controle e legibilidade para o play da musica atual
func playMusic() -> void:
	musicPlayer.play()

# Controla a continuidade do strem de muscias
func _on_MusicPlayer_finished():
	# Verifica se há proxima musica e itera o índice, caso não volta ao indice inicial
	if musicNum >= musicDatabase.size():
		musicNum = 1
	else:
		musicNum += 1
	
	# Atribuição do indice atual e inicio da musica selecionada
	musicPlayer.stream = musicDatabase.get(musicNum)
	playMusic()
	print(musicNum >= musicDatabase.size())

