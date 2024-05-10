extends Node

var master_bus = AudioServer.get_bus_index('Master')
var music_bus = AudioServer.get_bus_index('Music')

func _ready() -> void:
	$MasterVolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus))
	$MusicVolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus))

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus, linear_to_db(value))

func _unhandled_input(event):
	if Input.is_action_just_pressed("esc") and not $"../../..".upgrading:
		get_tree().paused = not get_tree().paused
		self.visible = get_tree().paused

func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menu.tscn")

func _on_continue_button_pressed():
	get_tree().paused = false
	self.visible = get_tree().paused

func _on_master_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, linear_to_db(value))

func _on_music_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))
