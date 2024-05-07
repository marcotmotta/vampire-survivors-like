extends CharacterBody2D

var upgrades = {
	'fireball': {
		'upgrade': 'fireball',
		'scene': preload("res://Weapons/Fireball/Fireball.tscn"),
		'icon': preload("res://Weapons/fireball_icon.png"),
		'callable': Callable(self, 'get_weapon_fireball'),
		'type': 'weapon',
		'label': 'FIREBALL // NEW WEAPON',
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
		'stats': {
			'damage': 10,
			'base_cooldown': 2, # seconds
			'bonus_cooldown': 0, # percentage (0 - 1)
			'current_cooldown': 2, # starts with the value of base_cooldown
			'count': 1,
			'damage_dealt': 0,
		},
		'upgrades': [
			{ # + atk count
				'callable': Callable(self, 'upgrade_atk_count_fireball'),
				'label': 'FIREBALL // + Atk Count',
				'icon': preload("res://Weapons/fireball_icon.png"),
				'rarity': 1,
				'max_level': 2,
				'current_level': 0
			},
			{ # + atk damage
				'callable': Callable(self, 'upgrade_atk_damage_fireball'),
				'label': 'FIREBALL // + Atk Damage',
				'icon': preload("res://Weapons/fireball_icon.png"),
				'rarity': 1,
				'max_level': 7,
				'current_level': 0
			}
		]
	},
	'thunder': {
		'upgrade': 'thunder',
		'scene': preload("res://Weapons/Thunder/Thunder.tscn"),
		'icon': preload("res://Weapons/thunder_icon.png"),
		'callable': Callable(self, 'get_weapon_thunder'),
		'type': 'weapon',
		'label': 'THUNDER // NEW WEAPON',
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
		'stats': {
			'damage': 20,
			'base_cooldown': 2.4, # seconds
			'bonus_cooldown': 0, # percentage (0 - 1)
			'current_cooldown': 2.4, # starts with the value of base_cooldown
			'count': 1,
			'damage_dealt': 0,
		},
		'upgrades': [
			{ # + atk count
				'callable': Callable(self, 'upgrade_atk_count_thunder'),
				'label': 'THUNDER // + Atk Count',
				'icon': preload("res://Weapons/thunder_icon.png"),
				'rarity': 1,
				'max_level': 2,
				'current_level': 0
			},
			{ # + atk damage
				'callable': Callable(self, 'upgrade_atk_damage_thunder'),
				'label': 'THUNDER // + Atk Damage',
				'icon': preload("res://Weapons/thunder_icon.png"),
				'rarity': 1,
				'max_level': 7,
				'current_level': 0
			}
		]
	},
	'laser': {
		'upgrade': 'laser',
		'scene': preload("res://Weapons/Laser/Laser.tscn"),
		'icon': preload("res://Weapons/laser_icon.png"),
		'callable': Callable(self, 'get_weapon_laser'),
		'type': 'weapon',
		'label': 'LASER // NEW WEAPON',
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
		'stats': {
			'damage': 10,
			'base_cooldown': 3, # seconds
			'bonus_cooldown': 0, # percentage (0 - 1)
			'current_cooldown': 3, # starts with the value of base_cooldown
			'count': 1,
			'damage_dealt': 0,
		},
		'upgrades': [
			{ # + atk count
				'callable': Callable(self, 'upgrade_atk_count_laser'),
				'label': 'LASER // + Atk Count',
				'icon': preload("res://Weapons/laser_icon.png"),
				'rarity': 1,
				'max_level': 2,
				'current_level': 0
			},
			{ # + atk damage
				'callable': Callable(self, 'upgrade_atk_damage_laser'),
				'label': 'LASER // + Atk Damage',
				'icon': preload("res://Weapons/laser_icon.png"),
				'rarity': 1,
				'max_level': 7,
				'current_level': 0
			}
		]
	},
	'void': {
		'upgrade': 'void',
		'scene': preload("res://Weapons/Void/Void.tscn"),
		'icon': preload("res://Weapons/void_icon.png"),
		'callable': Callable(self, 'get_weapon_void'),
		'type': 'weapon',
		'label': 'VOID // NEW WEAPON',
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
		'stats': {
			'damage': 6,
			'base_cooldown': 7, # seconds
			'bonus_cooldown': 0, # percentage (0 - 1)
			'current_cooldown': 7, # starts with the value of base_cooldown
			'aoe': 0,
			'damage_dealt': 0,
		},
		'upgrades': [
			{ # + atk damage
				'callable': Callable(self, 'upgrade_atk_damage_void'),
				'label': 'VOID // + Atk Damage',
				'icon': preload("res://Weapons/void_icon.png"),
				'rarity': 1,
				'max_level': 6, # must be a pair number (mark do futuro: nao pergunte apenas aceite)
				'current_level': 0
			},
			{ # + aoe
				'callable': Callable(self, 'upgrade_aoe_void'),
				'label': 'VOID // + AoE',
				'icon': preload("res://Weapons/void_icon.png"),
				'rarity': 1,
				'max_level': 3,
				'current_level': 0
			}
		]
	},
	'poison': {
		'upgrade': 'poison',
		'scene': preload("res://Weapons/Poison/Poison.tscn"),
		'icon': preload("res://Weapons/poison_icon.png"),
		'callable': Callable(self, 'get_weapon_poison'),
		'type': 'weapon',
		'label': 'POISON // NEW WEAPON',
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
		'stats': {
			'damage': 6,
			'base_cooldown': 6, # seconds
			'bonus_cooldown': 0, # percentage (0 - 1)
			'current_cooldown': 6, # starts with the value of base_cooldown
			'aoe': 0,
			'count': 1,
			'damage_dealt': 0,
		},
		'upgrades': [
			{ # + atk damage
				'callable': Callable(self, 'upgrade_atk_damage_poison'),
				'label': 'POISON // + Atk Damage',
				'icon': preload("res://Weapons/poison_icon.png"),
				'rarity': 1,
				'max_level': 4, # must be a pair number (mark do futuro: nao pergunte apenas aceite)
				'current_level': 0
			},
			{ # + aoe
				'callable': Callable(self, 'upgrade_aoe_poison'),
				'label': 'POISON // + AoE',
				'icon': preload("res://Weapons/poison_icon.png"),
				'rarity': 1,
				'max_level': 3,
				'current_level': 0
			},
			{ # + atk count
				'callable': Callable(self, 'upgrade_atk_count_poison'),
				'label': 'POISON // + Atk Count',
				'icon': preload("res://Weapons/poison_icon.png"),
				'rarity': 1,
				'max_level': 2,
				'current_level': 0
			},
		]
	},
	'atk_damage': {
		'upgrade': 'atk_damage',
		'callable': Callable(self, 'upgrade_atk_damage_all'),
		'type': 'buff',
		'label': 'ALL // + Atk Damage',
		'icon': preload("res://Weapons/atk_damage_icon.png"),
		'rarity': 2,
		'max_level': 5,
		'current_level': 0
	},
	'atk_speed': {
		'upgrade': 'atk_speed',
		'callable': Callable(self, 'upgrade_atk_speed_all'),
		'type': 'buff',
		'label': 'ALL // + Atk Speed',
		'icon': preload("res://Weapons/atk_speed_icon.png"),
		'rarity': 2,
		'max_level': 8,
		'current_level': 0
	},
	'atk_count': {
		'upgrade': 'atk_count',
		'callable': Callable(self, 'upgrade_atk_count_all'),
		'type': 'buff',
		'label': 'ALL // + Atk Count',
		'icon': preload("res://Weapons/atk_count_icon.png"),
		'rarity': 2,
		'max_level': 2,
		'current_level': 0
	},
	'health': {
		'upgrade': 'health',
		'callable': Callable(self, 'upgrade_health'),
		'type': 'buff',
		'label': '+ MAX HEALTH',
		'icon': preload("res://Weapons/health_icon.png"),
		'rarity': 1,
		'max_level': 6,
		'current_level': 0,
		'stats': {
			'max': 100,
			'current': 100
		}
	},
	'move_speed': {
		'upgrade': 'move_speed',
		'callable': Callable(self, 'upgrade_move_speed'),
		'type': 'buff',
		'label': '+ MOVE SPEED',
		'icon': preload("res://Weapons/move_speed_icon.png"),
		'rarity': 1,
		'max_level': 4,
		'current_level': 0,
		'stats': {
			'current': 100
		}
	},
}

# player model
var player_model_scene = preload("res://Player/PlayerModel.tscn")
var animated_player

# sounds
var sound_scene = preload("res://SFX/Sound.tscn")
var fixed_sound_scene = preload("res://SFX/FixedSound.tscn")
var level_up_sound = preload("res://SFX/level_up_sound.wav")
var hurt_sound = preload("res://SFX/hurt_sound.wav")
var heal_sound = preload("res://SFX/heal_sound.wav")
var hover_sound = preload("res://SFX/hover_sound.wav")
var upgrade_sound = preload("res://SFX/upgrade_sound.wav")

var buttons = [{},{},{}]

var weapon_icons = []
var buff_icons = []

# exp and leveling
# exp needed to level = base_exp + current_level * exp_level_ratio
var current_level = 1
var base_exp = 1
var exp_level_ratio = 3
var current_exp = 0

var kills = 0

var upgrading = false

func _ready():
	randomize()

	# FIXME: i dont like this at all, maybe theres a better way with just one "animatedsprite"
	# select player model
	var player_model_instance = player_model_scene.instantiate()
	animated_player = player_model_instance.get_node(Globals.current_color)
	animated_player.visible = true
	add_child(player_model_instance)

	match Globals.current_starting_weapon:
		'fireball':
			get_weapon_fireball()
			upgrades['fireball'].current_level += 1
		'thunder':
			get_weapon_thunder()
			upgrades['thunder'].current_level += 1
		'laser':
			get_weapon_laser()
			upgrades['laser'].current_level += 1
		'void':
			get_weapon_void()
			upgrades['void'].current_level += 1
		'poison':
			get_weapon_poison()
			upgrades['poison'].current_level += 1

func get_input():
	var input_direction = Input.get_vector("a", "d", "w", "s")
	velocity = input_direction * upgrades.move_speed.stats.current

	if velocity:
		animated_player.play('run')
	else:
		animated_player.play('idle')

func _physics_process(delta):
	get_input()
	move_and_slide()

func play_sound(scene, sound):
	var sound_instance = scene.instantiate()
	sound_instance.stream = sound
	if sound_instance is AudioStreamPlayer2D:
		sound_instance.global_position = global_position
	get_parent().add_child(sound_instance)

func calculate_weapon_level(weapon):
	var upgrade = upgrades[weapon]
	var sum_max_level = upgrade.max_level
	sum_max_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.max_level, sum_max_level)
	var sum_current_level = upgrade.current_level
	sum_current_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.current_level, sum_current_level)
	return {'sum_max_level': sum_max_level, 'sum_current_level': sum_current_level}

func calculate_icon_position():
	# weapon icons display
	for i in range(weapon_icons.size()):
		var icon = $CanvasLayer/Control.get_node(weapon_icons[i] + 'Icon')
		icon.position = Vector2(20 + i * 60, 20)
		icon.visible = true
		var label = $CanvasLayer/Control.get_node(weapon_icons[i] + 'Label')
		var sums = calculate_weapon_level(weapon_icons[i])
		label.text = str(sums.sum_current_level)
		if sums.sum_current_level >= sums.sum_max_level:
			label.label_settings.font_color = 'ffd600'
		label.position = Vector2(20 + i * 60, 70)
		label.visible = true

	# buff icons display
	for i in range(buff_icons.size()):
		var icon = $CanvasLayer/Control.get_node(buff_icons[i] + 'Icon')
		icon.position = Vector2(20 + i * 50, 110)
		icon.visible = true
		var label = $CanvasLayer/Control.get_node(buff_icons[i] + 'Label')
		var upgrade = upgrades[buff_icons[i]]
		label.text = str(upgrade.current_level)
		if upgrade.current_level >= upgrade.max_level:
			label.label_settings.font_color = 'ffd600'
		label.position = Vector2(20 + i * 50, 152)
		label.visible = true

func _process(delta):
	# fps
	$CanvasLayer/Control/FpsLabel.text = 'FPS: ' + str(Engine.get_frames_per_second())

	# health bar
	$HealthBar.max_value = upgrades.health.stats.max
	$HealthBar.value = upgrades.health.stats.current

	# exp bar
	$CanvasLayer/Control/ExpBar.max_value = base_exp + current_level * exp_level_ratio
	$CanvasLayer/Control/ExpBar.value = current_exp

	# canculte atk speed and cooldown
	upgrades.fireball.stats.current_cooldown = upgrades.fireball.stats.base_cooldown * (1 - upgrades.fireball.stats.bonus_cooldown)
	upgrades.thunder.stats.current_cooldown = upgrades.thunder.stats.base_cooldown * (1 - upgrades.thunder.stats.bonus_cooldown)
	upgrades.laser.stats.current_cooldown = upgrades.laser.stats.base_cooldown * (1 - upgrades.laser.stats.bonus_cooldown)
	upgrades.void.stats.current_cooldown = upgrades.void.stats.base_cooldown * (1 - upgrades.void.stats.bonus_cooldown)
	upgrades.poison.stats.current_cooldown = upgrades.poison.stats.base_cooldown * (1 - upgrades.poison.stats.bonus_cooldown)

	# icons
	calculate_icon_position()

	# show stats
	var stats = ''
	stats += 'Lv ' + str(current_level) + '\n'

	$CanvasLayer/Control/StatsLabel.text = stats

	# show damage dealt
	var damage_dealt = ''
	damage_dealt += 'Fireball: ' + str(upgrades.fireball.stats.damage_dealt) + '\n'
	damage_dealt += 'Thunder: ' + str(upgrades.thunder.stats.damage_dealt) + '\n'
	damage_dealt += 'Laser: ' + str(upgrades.laser.stats.damage_dealt) + '\n'
	damage_dealt += 'Void: ' + str(upgrades.void.stats.damage_dealt) + '\n'
	damage_dealt += 'Poison: ' + str(upgrades.poison.stats.damage_dealt) + '\n'

	$CanvasLayer/Control/PauseUI/DamageDealtLabel.text = damage_dealt

	# show kill count
	$CanvasLayer/Control/KillsLabel.text = 'Kills: ' + str(kills)

func _get_closest_enemy():
	var closest_enemy = null
	var closest_enemy_distance = 0
	var closest_enemy_direction = Vector2.ZERO

	for enemy in get_tree().get_nodes_in_group("enemy"):
		if (not closest_enemy) or (closest_enemy and (enemy.position - position).length() < closest_enemy_distance):
			closest_enemy = enemy
			closest_enemy_distance = (enemy.position - position).length()
			closest_enemy_direction = (enemy.position - position).normalized()

	return {
		'enemy': closest_enemy,
		'direction': closest_enemy_direction
	}

func _get_random_enemy():
	var enemies = get_tree().get_nodes_in_group("enemy")
	var selected_enemy = null
	var selected_enemy_direction = Vector2.ZERO

	if enemies:
		selected_enemy = enemies.pick_random()
		selected_enemy_direction = (selected_enemy.position - position).normalized()

	return {
		'enemy': selected_enemy,
		'direction': selected_enemy_direction
	}

# weapon hit triggers
func _on_fireball_timer_timeout():
	var closest_enemy = _get_closest_enemy()
	$FireballTimer.start(upgrades.fireball.stats.current_cooldown)
	if closest_enemy.enemy:
		for i in range(upgrades.fireball.stats.count):
			var shift = 0 if i == 0 else randi_range(-20, 20)
			var fireball_instance = upgrades.fireball.scene.instantiate()
			fireball_instance.global_position = global_position
			fireball_instance.direction = closest_enemy.direction.rotated(deg_to_rad(shift))
			fireball_instance.damage = ceil(upgrades.fireball.stats.damage * (1 + upgrades.atk_damage.current_level * 0.15))
			var sums = calculate_weapon_level('fireball')
			fireball_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			get_parent().add_child(fireball_instance)
			await get_tree().create_timer(0.05).timeout

func _on_thunder_timer_timeout():
	$ThunderTimer.start(upgrades.thunder.stats.current_cooldown)
	for i in range(upgrades.thunder.stats.count):
		var selected_enemy = _get_random_enemy()
		if selected_enemy.enemy:
			var thunder_instance = upgrades.thunder.scene.instantiate()
			thunder_instance.global_position = selected_enemy.enemy.global_position
			thunder_instance.damage = ceil(upgrades.thunder.stats.damage * (1 + upgrades.atk_damage.current_level * 0.15))
			var sums = calculate_weapon_level('thunder')
			thunder_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			get_parent().add_child(thunder_instance)
			await get_tree().create_timer(0.10).timeout

func _on_laser_timer_timeout():
	$LaserTimer.start(upgrades.laser.stats.current_cooldown)
	for i in range(upgrades.laser.stats.count):
		var selected_enemy = _get_random_enemy()
		if selected_enemy.enemy:
			var laser_instance = upgrades.laser.scene.instantiate()
			laser_instance.direction = selected_enemy.direction
			laser_instance.damage = ceil(upgrades.laser.stats.damage * (1 + upgrades.atk_damage.current_level * 0.15))
			var sums = calculate_weapon_level('laser')
			laser_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			add_child(laser_instance)
			await get_tree().create_timer(0.15).timeout

func _on_void_timer_timeout():
	$VoidTimer.start(upgrades.void.stats.current_cooldown)
	var void_instance = upgrades.void.scene.instantiate()
	void_instance.damage = ceil(upgrades.void.stats.damage * (1 + upgrades.atk_damage.current_level * 0.15))
	void_instance.aoe = upgrades.void.stats.aoe
	var sums = calculate_weapon_level('void')
	void_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
	add_child(void_instance)

func _on_poison_timer_timeout():
	$PoisonTimer.start(upgrades.poison.stats.current_cooldown)
	for i in range(upgrades.poison.stats.count):
		var selected_enemy = _get_random_enemy()
		if selected_enemy.enemy:
			var poison_instance = upgrades.poison.scene.instantiate()
			poison_instance.global_position = ((selected_enemy.enemy.global_position - global_position) / 1.3) + global_position
			poison_instance.damage = ceil(upgrades.poison.stats.damage * (1 + upgrades.atk_damage.current_level * 0.15))
			poison_instance.aoe = upgrades.poison.stats.aoe
			var sums = calculate_weapon_level('poison')
			poison_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			get_parent().add_child(poison_instance)
			await get_tree().create_timer(0.15).timeout

# health interation functions
func heal(amount):
	play_sound(sound_scene, heal_sound)

	upgrades.health.stats.current = min(upgrades.health.stats.current + amount, upgrades.health.stats.max)

func take_damage(amount):
	play_sound(sound_scene, hurt_sound)

	upgrades.health.stats.current -= amount
	if upgrades.health.stats.current <= 0:
		$CanvasLayer/Control/EndUI.end(true)

# leveling functions
func _get_upgrades():
	var upgrade_count = 3

	var primary_upgrades = upgrades.values().filter(func(u): return u.current_level < u.max_level)
	var variant_upgrades = upgrades.values().filter(func(u): return u.type == 'weapon' and u.has('upgrades') and u.upgrades.any(func(v): return v.current_level < v.max_level))
	var filtered_variant_upgrades = []
	for v in variant_upgrades:
		if not v.current_level < v.max_level:
			for u in v.upgrades:
				if u.current_level < u.max_level:
					filtered_variant_upgrades.append(u)

	var filtered_upgrades = primary_upgrades + filtered_variant_upgrades
	filtered_upgrades.shuffle()
	
	if not filtered_upgrades.size():
		return false

	# give upgrades options to player
	for i in range(upgrade_count):
		var button = $CanvasLayer/Control/UpgradeList.get_node('Button' + str(i))

		if i < filtered_upgrades.size():
			var selected_upgrade = filtered_upgrades[i]
			button.text = selected_upgrade.label
			button.icon = selected_upgrade.icon
			if selected_upgrade.rarity == 3:
				button['theme_override_colors/font_color'] = 'ffd600'
				button['theme_override_colors/font_hover_color'] = 'ffd600'
				button['theme_override_styles/normal'].border_color = 'ffd600'
				button['theme_override_styles/hover'].border_color = 'ffd600'
			elif selected_upgrade.rarity == 2:
				button['theme_override_colors/font_color'] = '00e1ff'
				button['theme_override_colors/font_hover_color'] = '00e1ff'
				button['theme_override_styles/normal'].border_color = '00e1ff'
				button['theme_override_styles/hover'].border_color = '00e1ff'
			else:
				button['theme_override_colors/font_color'] = 'ffffff'
				button['theme_override_colors/font_hover_color'] = 'ffffff'
				button['theme_override_styles/normal'].border_color = 'ffffff'
				button['theme_override_styles/hover'].border_color = 'ffffff'
			buttons[i] = selected_upgrade
			button.disabled = false
		else:
			button.text = ''
			button.icon = null
			buttons[i] = {}
			button.disabled = true

	return true

func level_up():
	play_sound(fixed_sound_scene, level_up_sound)

	current_level += 1
	if current_level >= 80:
		$CanvasLayer/Control/EndUI.end(false)
		return

	if _get_upgrades():
		$CanvasLayer/Control/UpgradeList.visible = true
		upgrading = true
		get_tree().paused = true

func get_exp(amount):
	current_exp += amount
	if current_exp >= base_exp + current_level * exp_level_ratio: # simple level up logic
		current_exp = 0
		level_up()

# upgrade functions
func upgrade_atk_damage_fireball():
	upgrades.fireball.stats.damage += 1

func upgrade_atk_damage_thunder():
	upgrades.thunder.stats.damage += 1

func upgrade_atk_damage_laser():
	upgrades.laser.stats.damage += 1

func upgrade_atk_damage_void():
	upgrades.void.stats.damage += 2

func upgrade_atk_damage_poison():
	upgrades.poison.stats.damage += 2

func upgrade_atk_damage_all():
	if not buff_icons.has('atk_damage'):
		buff_icons.append('atk_damage')
	#upgrade_atk_damage_fireball()
	#upgrade_atk_damage_thunder()
	#upgrade_atk_damage_laser()
	#upgrade_atk_damage_void() 
	#pgrade_atk_damage_poison()

func upgrade_atk_speed_all():
	if not buff_icons.has('atk_speed'):
		buff_icons.append('atk_speed')
	# everything here is dealt in percentage,
	# since the variables bonus_<weapon>_cooldown is a percentage from 0 to 1
	# i.e. "upgrades.fireball.stats.bonus_cooldown + 0.05" will increase atk speed of fireballs by 5%
	upgrades.fireball.stats.bonus_cooldown += 0.05
	upgrades.thunder.stats.bonus_cooldown += 0.05
	upgrades.laser.stats.bonus_cooldown += 0.05
	upgrades.void.stats.bonus_cooldown += 0.05
	upgrades.poison.stats.bonus_cooldown += 0.05

func upgrade_atk_count_fireball():
	upgrades.fireball.stats.count += 1

func upgrade_atk_count_thunder():
	upgrades.thunder.stats.count += 1

func upgrade_atk_count_laser():
	upgrades.laser.stats.count += 1

func upgrade_atk_count_poison():
	upgrades.poison.stats.count += 1

func upgrade_atk_count_all():
	if not buff_icons.has('atk_count'):
		buff_icons.append('atk_count')
	upgrade_atk_count_fireball()
	upgrade_atk_count_thunder()
	upgrade_atk_count_laser()
	upgrade_atk_count_poison()

func upgrade_aoe_void():
	upgrades.void.stats.aoe += 1

func upgrade_aoe_poison():
	upgrades.poison.stats.aoe += 1

func upgrade_health():
	if not buff_icons.has('health'):
		buff_icons.append('health')
	upgrades.health.stats.max += 25
	upgrades.health.stats.current = min(upgrades.health.stats.current + 20, upgrades.health.stats.max)

func upgrade_move_speed():
	if not buff_icons.has('move_speed'):
		buff_icons.append('move_speed')

	upgrades.move_speed.stats.current += 25

func get_weapon_fireball():
	$FireballTimer.start(upgrades.fireball.stats.current_cooldown)
	weapon_icons.append('fireball')

func get_weapon_thunder():
	$ThunderTimer.start(upgrades.thunder.stats.current_cooldown)
	weapon_icons.append('thunder')

func get_weapon_laser():
	$LaserTimer.start(upgrades.laser.stats.current_cooldown)
	weapon_icons.append('laser')

func get_weapon_void():
	$VoidTimer.start(1)
	weapon_icons.append('void')

func get_weapon_poison():
	$PoisonTimer.start(1)
	weapon_icons.append('poison')

# upgrade buttons
func _on_button_0_pressed():
	play_sound(fixed_sound_scene, upgrade_sound)
	buttons[0].callable.call()
	buttons[0].current_level += 1
	upgrading = false
	get_tree().paused = false
	$CanvasLayer/Control/UpgradeList.visible = false

func _on_button_1_pressed():
	play_sound(fixed_sound_scene, upgrade_sound)
	buttons[1].callable.call()
	buttons[1].current_level += 1
	upgrading = false
	get_tree().paused = false
	$CanvasLayer/Control/UpgradeList.visible = false

func _on_button_2_pressed():
	play_sound(fixed_sound_scene, upgrade_sound)
	buttons[2].callable.call()
	buttons[2].current_level += 1
	upgrading = false
	get_tree().paused = false
	$CanvasLayer/Control/UpgradeList.visible = false

func _on_button_0_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)

func _on_button_1_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)

func _on_button_2_mouse_entered():
	play_sound(fixed_sound_scene, hover_sound)
