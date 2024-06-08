extends Node

const SERCOMM = preload("res://addons/GDSerCommDock/bin/GDSerComm.gdns")
onready var PORT = SERCOMM.new()
onready var com=$Com

var buttonValue: int = 0
var sliderValue: int = 0
var serialMessage = "" # Mensagem enviada pelo Esplora que contém os valores dos sensores.


var port = "/dev/ttyACM0"
var baudRate = 9600
var message_to_send

func _ready():
	set_physics_process(false)
	PORT.close()
	if port!=null and baudRate!=0:
		PORT.open(port,baudRate,1000,com.bytesz.SER_BYTESZ_8, com.parity.SER_PAR_NONE, com.stopbyte.SER_STOPB_ONE)
		PORT.flush()
	else:
		print("Não foi possível estabelecer uma comunicação com a porta desejada. Cheque se a porta desejada foi selecionada corretamente.")
	set_physics_process(true)

func _physics_process(delta):
	if buttonValue == 1:
		print("MEU CU")
		buttonValue = 0;
	
	if PORT != null && PORT.get_available()>0:
		for i in range(PORT.get_available()):
			var _currentChar = str(PORT.read()) # Caractere enviado pelo Esplora.
			if _currentChar == "]": # Verifica se o caractere é o indicado como fim da string de valores de sensores.
				unpackMessage(serialMessage)
				serialMessage = ""
			else:
				serialMessage += _currentChar # Adiciona o caractere na mensagem 

# Adiciona as informações enviadas pelos sensores às suas respectivas variáveis
func unpackMessage(message) -> void:
#	print("Desempacotando: ", message)
	var sensorTags : Array = message.split("#") # Array dos inputs enviados pelo Esplora onde a "#" é o char que indica o fim do input
	for tag in sensorTags:
		var sensorValue : Array = tag.split(":")
		match sensorValue[0]:
			"sl":
				sliderValue = int(sensorValue[1])
			_:
			_:
				pass

func send_text():
	var text=message_to_send.text.replace(("\\n"),com.endline)

	PORT.write(text) #write function, please use only ascii
