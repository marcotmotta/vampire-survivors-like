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
			$RecordLevel.text = 'YOU DIED\n\nLevel\n' + str(player.current_level)
		else:
			$RecordLevel.text = 'YOU WON\n\nLevel\n' + str(player.current_level)

	# check unlockables
	$UnlockedLabel.text = ''
	for locked_color in Globals.locked_colors:
		# case: unlocked a color
		# add it to color array;
		# show in the UI;
		# remove it from locked_colors array;
		if locked_color.level <= player.current_level and locked_color.color not in Globals.colors:
			Globals.colors.append(locked_color.color)
			$UnlockedLabel.text += 'NEW COLOR UNLOCKED! - ' + locked_color.color.capitalize() + '\n'
	for locked_starting_weapon in Globals.locked_starting_weapons:
		# case: unlocked a starting_weapon
		# add it to starting_weapon array;
		# show in the UI;
		# remove it from locked_starting_weapons array;
		if locked_starting_weapon.level <= player.current_level and locked_starting_weapon.weapon not in Globals.starting_weapons:
			Globals.starting_weapons.append(locked_starting_weapon.weapon)
			$UnlockedLabel.text += 'NEW STARTING WEAPON UNLOCKED! - ' + locked_starting_weapon.weapon.capitalize() + '\n'

func _on_back_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menu.tscn")
