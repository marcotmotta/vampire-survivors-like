extends Node

# game version
var game_version = '0.2'

# player model color
var colors = [
	'black',
	'red'
]

var current_color_idx = 0
var current_color = 'black'

var locked_colors = [
	{ 'color': 'blue', 'level': 30 },
	{ 'color': 'gold', 'level': 60 },
]

var starting_weapons = [
	'fireball',
	'thunder'
]

var current_starting_weapon_idx = 0
var current_starting_weapon = 'fireball'

var locked_starting_weapons = [
	{ 'weapon': 'laser', 'level': 10 },
	{ 'weapon': 'void', 'level': 40 },
	{ 'weapon': 'poison', 'level': 50 },
]

# save and load
var record_level = 0

func save_game():
	var save_file = FileAccess.open("user://savefile.save", FileAccess.WRITE)
	var save_data = {
		'game_version': game_version,
		'record_level': record_level
	}
	var json_string = JSON.stringify(save_data)
	save_file.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savefile.save"):
		return # Error! We don't have a save to load.

	var save_file = FileAccess.open("user://savefile.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		var node_data = json.get_data()

		# load data into the game components
		if not node_data.has('game_version') or game_version != node_data['game_version']:
			return

		record_level = node_data['record_level']

func check_unlockables():
	for locked_color in locked_colors:
		if locked_color.level <= record_level:
			colors.append(locked_color.color)
			locked_colors.erase(locked_color)
	for locked_starting_weapon in locked_starting_weapons:
		if locked_starting_weapon.level <= record_level:
			starting_weapons.append(locked_starting_weapon.weapon)
			locked_starting_weapons.erase(locked_starting_weapon)

func _ready():
	#load_game()
	check_unlockables()
