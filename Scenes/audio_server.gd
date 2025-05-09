extends Control

var server = TCPServer.new()
var client = null

func _ready() -> void:
	#print(AudioServer.get_output_device_list())
	#AudioServer.set_output_device("XB273 GX (NVIDIA High Definition Audio")
	server.listen(12345)
	get_viewport().get_window().mode = Window.MODE_MINIMIZED
	#get_viewport().resizable = false

func _process(_delta: float) -> void:
	if server.is_connection_available() and client == null:
		client = server.take_connection()
	if client and client.get_available_bytes() > 0:
		var recieved = client.get_string(client.get_available_bytes())
		if recieved.left(10) == "PlayAudio:":
			PlayAudio("res://Audio/" + recieved.substr(10))
		elif recieved.left(11) == "PlayAudioP:":
			PlayAudioPitched("res://Audio/" + recieved.substr(10))
		elif recieved.left(10) == "PlayMusic:":
			$Music.stream = load("res://Audio/" + recieved.substr(10))
			$Music.play()
		elif recieved == "EndAudio":
			get_tree().quit()

func PlayAudio(inp):
	if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.stream = load(inp)
		$AudioStreamPlayer2D.play()
	elif !$AudioStreamPlayer2D2.is_playing():
		$AudioStreamPlayer2D2.stream = load(inp)
		$AudioStreamPlayer2D2.play()
	elif !$AudioStreamPlayer2D3.is_playing():
		$AudioStreamPlayer2D3.stream = load(inp)
		$AudioStreamPlayer2D3.play()
	elif !$AudioStreamPlayer2D4.is_playing():
		$AudioStreamPlayer2D4.stream = load(inp)
		$AudioStreamPlayer2D4.play()
	elif !$AudioStreamPlayer2D5.is_playing():
		$AudioStreamPlayer2D5.stream = load(inp)
		$AudioStreamPlayer2D5.play()

func PlayAudioPitched(inp):
	if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.pitch_scale = randf_range(.75, 1.25)
		$AudioStreamPlayer2D.stream = load(inp)
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished
		$AudioStreamPlayer2D.pitch_scale = 1
	elif !$AudioStreamPlayer2D2.is_playing():
		$AudioStreamPlayer2D2.pitch_scale = randf_range(.75, 1.25)
		$AudioStreamPlayer2D2.stream = load(inp)
		$AudioStreamPlayer2D2.play()
		await $AudioStreamPlayer2D2.finished
		$AudioStreamPlayer2D2.pitch_scale = 1
	elif !$AudioStreamPlayer2D3.is_playing():
		$AudioStreamPlayer2D3.pitch_scale = randf_range(.75, 1.25)
		$AudioStreamPlayer2D3.stream = load(inp)
		$AudioStreamPlayer2D3.play()
		await $AudioStreamPlayer2D3.finished
		$AudioStreamPlayer2D3.pitch_scale = 1
	elif !$AudioStreamPlayer2D4.is_playing():
		$AudioStreamPlayer2D4.pitch_scale = randf_range(.75, 1.25)
		$AudioStreamPlayer2D4.stream = load(inp)
		$AudioStreamPlayer2D4.play()
		await $AudioStreamPlayer2D4.finished
		$AudioStreamPlayer2D4.pitch_scale = 1
	elif !$AudioStreamPlayer2D5.is_playing():
		$AudioStreamPlayer2D5.pitch_scale = randf_range(.75, 1.25)
		$AudioStreamPlayer2D5.stream = load(inp)
		$AudioStreamPlayer2D5.play()
		await $AudioStreamPlayer2D5.finished
		$AudioStreamPlayer2D5.pitch_scale = 1


func _on_button_pressed() -> void:
	$AudioStreamPlayer2D.stream = load("res://Audio/Cat" + str(randi_range(1,4)) +  ".wav")#OS.get_executable_path() + "/../Cat1.wav")
	$AudioStreamPlayer2D.play()
