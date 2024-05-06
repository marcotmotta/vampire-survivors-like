extends Node2D

func _ready():
	$CanvasLayer/Control/ColorSelector/Color.color = Globals.current_color
	$CanvasLayer/Control/RecordLevel.text = 'Record Level\n' + str(Globals.record_level)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_left_pressed():
	Globals.current_color_idx -= 1
	if Globals.current_color_idx < 0:
		Globals.current_color_idx = Globals.colors.size() - 1
	Globals.current_color = Globals.colors[Globals.current_color_idx]
	$CanvasLayer/Control/ColorSelector/Color.color = Globals.colors[Globals.current_color_idx]

func _on_right_pressed():
	Globals.current_color_idx += 1
	if Globals.current_color_idx >= Globals.colors.size():
		Globals.current_color_idx = 0
	Globals.current_color = Globals.colors[Globals.current_color_idx]
	$CanvasLayer/Control/ColorSelector/Color.color = Globals.colors[Globals.current_color_idx]
