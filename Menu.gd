extends Node2D

# sound
var fixed_sound_scene = preload("res://SFX/FixedSound.tscn")
var hover_sound = preload("res://SFX/hover_sound.wav")

# weapon icons
var weapon_icons = {
	'fireball': preload("res://Weapons/fireball_icon.png"),
	'thunder': preload("res://Weapons/thunder_icon.png"),
	'laser': preload("res://Weapons/laser_icon.png"),
	'void': preload("res://Weapons/void_icon.png"),
	'poison': preload("res://Weapons/poison_icon.png"),
}

# armor sprites
var armor_sprites = {}

func _ready():
	# game version label
	$CanvasLayer/Control/VersionLabel.text = 'v' + Globals.game_version

	armor_sprites = {
		'black': $CanvasLayer/Control/blackArmor,
		'blue': $CanvasLayer/Control/blueArmor,
		'red': $CanvasLayer/Control/redArmor,
		'gold': $CanvasLayer/Control/goldArmor
	}
	
	$CanvasLayer/Control/ColorSelector/Color.color = Globals.current_color
	$CanvasLayer/Control/Colorlabel.text = Globals.current_color.capitalize()
	for sprite in armor_sprites.values():
		sprite.visible = false
	armor_sprites[Globals.current_color].visible = true

	$CanvasLayer/Control/RecordLevel.text = 'RECORD LEVEL\n' + str(Globals.record_level)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_left_pressed():
	play_sound(fixed_sound_scene, hover_sound)
	Globals.current_color_idx -= 1
	if Globals.current_color_idx < 0:
		Globals.current_color_idx = Globals.colors.size() - 1
	Globals.current_color = Globals.colors[Globals.current_color_idx]
	$CanvasLayer/Control/ColorSelector/Color.color = Globals.colors[Globals.current_color_idx]
	$CanvasLayer/Control/Colorlabel.text = Globals.current_color.capitalize()
	for sprite in armor_sprites.values():
		sprite.visible = false
	armor_sprites[Globals.current_color].visible = true

func _on_right_pressed():
	play_sound(fixed_sound_scene, hover_sound)
	Globals.current_color_idx += 1
	if Globals.current_color_idx >= Globals.colors.size():
		Globals.current_color_idx = 0
	Globals.current_color = Globals.colors[Globals.current_color_idx]
	$CanvasLayer/Control/ColorSelector/Color.color = Globals.colors[Globals.current_color_idx]
	$CanvasLayer/Control/Colorlabel.text = Globals.current_color.capitalize()
	for sprite in armor_sprites.values():
		sprite.visible = false
	armor_sprites[Globals.current_color].visible = true

func _on_weapon_left_pressed():
	play_sound(fixed_sound_scene, hover_sound)
	Globals.current_starting_weapon_idx -= 1
	if Globals.current_starting_weapon_idx < 0:
		Globals.current_starting_weapon_idx = Globals.starting_weapons.size() - 1
	Globals.current_starting_weapon = Globals.starting_weapons[Globals.current_starting_weapon_idx]
	$CanvasLayer/Control/WeaponSelector/Weapon.texture = weapon_icons[Globals.current_starting_weapon]
	$CanvasLayer/Control/StartingWeaponLabel.text = Globals.current_starting_weapon.capitalize()

func _on_weapon_right_pressed():
	play_sound(fixed_sound_scene, hover_sound)
	Globals.current_starting_weapon_idx += 1
	if Globals.current_starting_weapon_idx >= Globals.starting_weapons.size():
		Globals.current_starting_weapon_idx = 0
	Globals.current_starting_weapon = Globals.starting_weapons[Globals.current_starting_weapon_idx]
	$CanvasLayer/Control/WeaponSelector/Weapon.texture = weapon_icons[Globals.current_starting_weapon]
	$CanvasLayer/Control/StartingWeaponLabel.text = Globals.current_starting_weapon.capitalize()

func play_sound(scene, sound):
	var sound_instance = scene.instantiate()
	sound_instance.stream = sound
	if sound_instance is AudioStreamPlayer2D:
		sound_instance.global_position = global_position
	get_parent().add_child(sound_instance)

func _on_play_button_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)

func _on_left_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)

func _on_right_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)

func _on_weapon_left_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)

func _on_weapon_right_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)
