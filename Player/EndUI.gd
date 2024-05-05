extends Node

func end(died = false):
	self.visible = true

	get_tree().paused = true

	var player = $"../../.."

	if player.current_level > Globals.record_level:
		Globals.record_level = player.current_level
		Globals.save_game()
		if died:
			$RecordLevel.text = 'YOU DIED\n\nNEW RECORD!\nLevel\n' + str(Globals.record_level)
		else:
			$RecordLevel.text = 'YOU WON\n\nNEW RECORD!\nLevel\n' + str(Globals.record_level)
	else:
		if died:
			$RecordLevel.text = 'YOU DIED\n\nLevel\n' + str(Globals.record_level)
		else:
			$RecordLevel.text = 'YOU WON\n\nLevel\n' + str(Globals.record_level)

func _on_back_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menu.tscn")
