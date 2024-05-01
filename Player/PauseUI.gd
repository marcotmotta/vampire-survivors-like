extends Node

func _unhandled_input(event):
	if Input.is_action_just_pressed("esc") and not $"../../..".upgrading:
		get_tree().paused = not get_tree().paused
		self.visible = get_tree().paused

func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menu.tscn")
