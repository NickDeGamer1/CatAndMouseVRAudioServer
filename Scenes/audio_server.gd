extends Control

var server = TCPServer.new()
var client = null

func _ready() -> void:
	#print(AudioServer.get_output_device_list())
	#AudioServer.set_output_device("XB273 GX (NVIDIA High Definition Audio")
	server.listen(12345)

func _process(_delta: float) -> void:
	if server.is_connection_available() and client == null:
		client = server.take_connection()
	
	if client and client.get_available_bytes() > 0:
		var recieved = client.get_string(client.get_available_bytes())
		if recieved == "PlayAudio":
			$AudioStreamPlayer2D.play()
		elif recieved == "EndAudio":
			get_tree().quit()
