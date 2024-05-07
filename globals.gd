extends Node

# game version
var game_version = '0.2'

# player model color
var colors = [
	'black',
	'red',
	'blue',
	'gold'
]

var current_color_idx = 0
var current_color = 'black'

var starting_weapons = [
	'fireball',
	'thunder',
	'laser',
	'void',
	'poison'
]

var current_starting_weapon_idx = 0
var current_starting_weapon = 'fireball'

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

func _ready():
	load_game()
