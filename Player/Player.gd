extends CharacterBody2D

var upgrades = [
	{
		'upgrade': 'fireball',
		'callable': Callable(self, 'get_weapon_fireball'),
		'type': 'weapon',
		'label': 'FIREBALL // NEW WEAPON',
		'icon': preload("res://Weapons/fireball_icon.png"),
		'rarity': 1,
		'max_level': 1,
		'current_level': 1,
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
				'max_level': 5,
				'current_level': 0
			}
		]
	},
	{
		'upgrade': 'thunder',
		'callable': Callable(self, 'get_weapon_thunder'),
		'type': 'weapon',
		'label': 'THUNDER // NEW WEAPON',
		'icon': preload("res://Weapons/thunder_icon.png"),
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
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
				'max_level': 5,
				'current_level': 0
			}
		]
	},
	{
		'upgrade': 'laser',
		'callable': Callable(self, 'get_weapon_laser'),
		'type': 'weapon',
		'label': 'LASER // NEW WEAPON',
		'icon': preload("res://Weapons/laser_icon.png"),
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
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
				'max_level': 5,
				'current_level': 0
			}
		]
	},
	{
		'upgrade': 'void',
		'callable': Callable(self, 'get_weapon_void'),
		'type': 'weapon',
		'label': 'VOID // NEW WEAPON',
		'icon': preload("res://Weapons/void_icon.png"),
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
		'upgrades': [
			{ # + atk damage
				'callable': Callable(self, 'upgrade_atk_damage_void'),
				'label': 'VOID // + Atk Damage',
				'icon': preload("res://Weapons/void_icon.png"),
				'rarity': 1,
				'max_level': 4, # must be a pair number (mark do futuro: nao pergunte apenas aceite)
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
	{
		'upgrade': 'poison',
		'callable': Callable(self, 'get_weapon_poison'),
		'type': 'weapon',
		'label': 'POISON // NEW WEAPON',
		'icon': preload("res://Weapons/poison_icon.png"),
		'rarity': 1,
		'max_level': 1,
		'current_level': 0,
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
	{
		'upgrade': 'atk_damage',
		'callable': Callable(self, 'upgrade_atk_damage_all'),
		'type': 'buff',
		'label': 'ALL // + Atk Damage',
		'icon': preload("res://Weapons/atk_damage_icon.png"),
		'rarity': 2,
		'max_level': 5,
		'current_level': 0
	},
	{
		'upgrade': 'atk_speed',
		'callable': Callable(self, 'upgrade_atk_speed_all'),
		'type': 'buff',
		'label': 'ALL // + Atk Speed',
		'icon': preload("res://Weapons/atk_speed_icon.png"),
		'rarity': 2,
		'max_level': 8,
		'current_level': 0
	},
	{
		'upgrade': 'atk_count',
		'callable': Callable(self, 'upgrade_atk_count_all'),
		'type': 'buff',
		'label': 'ALL // + Atk Count',
		'icon': preload("res://Weapons/atk_count_icon.png"),
		'rarity': 2,
		'max_level': 2,
		'current_level': 0
	},
	{
		'upgrade': 'health',
		'callable': Callable(self, 'upgrade_health'),
		'type': 'buff',
		'label': '+ MAX HEALTH',
		'icon': preload("res://Weapons/health_icon.png"),
		'rarity': 1,
		'max_level': 5,
		'current_level': 0
	},
	{
		'upgrade': 'move_speed',
		'callable': Callable(self, 'upgrade_move_speed'),
		'type': 'buff',
		'label': '+ MOVE SPEED',
		'icon': preload("res://Weapons/move_speed_icon.png"),
		'rarity': 1,
		'max_level': 999, # FIXME: debug purposes - change to 4
		'current_level': 0
	},
]

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

# health
var MAX_HEALTH = 100
var health = MAX_HEALTH

# movement speed logic
var base_speed = 100
var current_speed = base_speed

# fireball logic
var fireball_scene = preload("res://Weapons/Fireball/Fireball.tscn")
var fireball_icon = preload("res://Weapons/fireball_icon.png")
var fireball_damage = 10
var base_fireball_cooldown = 2 # seconds
var bonus_fireball_cooldown = 0 # percentage (0 - 1)
var current_fireball_cooldown = base_fireball_cooldown
var fireball_count = 1
var fireball_damage_dealt = 0

# thunder logic
var thunder_scene = preload("res://Weapons/Thunder/Thunder.tscn")
var thunder_icon = preload("res://Weapons/thunder_icon.png")
var thunder_damage = 10
var base_thunder_cooldown = 2.8 # seconds
var bonus_thunder_cooldown = 0 # percentage (0 - 1)
var current_thunder_cooldown = base_thunder_cooldown
var thunder_count = 1
var thunder_damage_dealt = 0

# laser logic
var laser_scene = preload("res://Weapons/Laser/Laser.tscn")
var laser_icon = preload("res://Weapons/laser_icon.png")
var laser_damage = 10
var base_laser_cooldown = 3 # seconds
var bonus_laser_cooldown = 0 # percentage (0 - 1)
var current_laser_cooldown = base_laser_cooldown
var laser_count = 1
var laser_damage_dealt = 0

# void logic
var void_scene = preload("res://Weapons/Void/Void.tscn")
var void_icon = preload("res://Weapons/void_icon.png")
var void_damage = 6
var base_void_cooldown = 7 # seconds
var bonus_void_cooldown = 0 # percentage (0 - 1)
var current_void_cooldown = base_void_cooldown
var void_aoe = 0
var void_damage_dealt = 0

# poison logic
var poison_scene = preload("res://Weapons/Poison/Poison.tscn")
var poison_icon = preload("res://Weapons/poison_icon.png")
var poison_damage = 6
var base_poison_cooldown = 6 # seconds
var bonus_poison_cooldown = 0 # percentage (0 - 1)
var current_poison_cooldown = base_poison_cooldown
var poison_aoe = 0
var poison_count = 1
var poison_damage_dealt = 0

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

	# FIXME: set the starting weapon. debug purposes
	get_weapon_fireball()
	#get_weapon_poison()

func get_input():
	var input_direction = Input.get_vector("a", "d", "w", "s")
	velocity = input_direction * current_speed

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
	var upgrade = upgrades.filter(func(u): return u.upgrade == weapon)[0]
	var sum_max_level = upgrade.max_level
	sum_max_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.max_level, sum_max_level)
	var sum_current_level = upgrade.current_level
	sum_current_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.current_level, sum_current_level)
	return {'sum_max_level': sum_max_level, 'sum_current_level': sum_current_level}

func calculate_icon_position():
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

	for i in range(buff_icons.size()):
		var icon = $CanvasLayer/Control.get_node(buff_icons[i] + 'Icon')
		icon.position = Vector2(20 + i * 50, 110)
		icon.visible = true
		var label = $CanvasLayer/Control.get_node(buff_icons[i] + 'Label')
		var upgrade = upgrades.filter(func(u): return u.upgrade == buff_icons[i])[0]
		label.text = str(upgrade.current_level)
		if upgrade.current_level >= upgrade.max_level:
			label.label_settings.font_color = 'ffd600'
		label.position = Vector2(20 + i * 50, 152)
		label.visible = true

func _process(delta):
	# health bar
	$HealthBar.max_value = MAX_HEALTH
	$HealthBar.value = health

	# exp bar
	$CanvasLayer/Control/ExpBar.max_value = base_exp + current_level * exp_level_ratio
	$CanvasLayer/Control/ExpBar.value = current_exp

	# canculte atk speed and cooldown
	current_fireball_cooldown = base_fireball_cooldown * (1 - bonus_fireball_cooldown)
	current_thunder_cooldown = base_thunder_cooldown * (1 - bonus_thunder_cooldown)
	current_laser_cooldown = base_laser_cooldown * (1 - bonus_laser_cooldown)
	current_void_cooldown = base_void_cooldown * (1 - bonus_void_cooldown)
	current_poison_cooldown = base_poison_cooldown * (1 - bonus_poison_cooldown)

	# icons
	calculate_icon_position()

	# show stats
	var stats = ''
	stats += 'Lv ' + str(current_level) + '\n'
	#stats += 'exp: ' + str(current_exp) + '/' + str(base_exp + current_level * exp_level_ratio) + '\n'
	#stats += '\n'
	#stats += 'health: ' + str(health) + '\n'
	#stats += 'movement speed: ' + str(current_speed) + '\n'
	#stats += 'fireball cd: ' + str(current_fireball_cooldown) + '\n'
	#stats += 'fireball count: ' + str(fireball_count) + '\n'
	#stats += 'thunder cd: ' + str(current_thunder_cooldown) + '\n'
	#stats += 'thunder count: ' + str(thunder_count) + '\n'
	#stats += 'laser cd: ' + str(current_laser_cooldown) + '\n'
	#stats += 'laser count: ' + str(laser_count) + '\n'
	#stats += 'void cd: ' + str(current_void_cooldown) + '\n'

	$CanvasLayer/Control/StatsLabel.text = stats

	# show damage dealt
	var damage_dealt = ''
	damage_dealt += 'Fireball: ' + str(fireball_damage_dealt) + '\n'
	damage_dealt += 'Thunder: ' + str(thunder_damage_dealt) + '\n'
	damage_dealt += 'Laser: ' + str(laser_damage_dealt) + '\n'
	damage_dealt += 'Void: ' + str(void_damage_dealt) + '\n'
	damage_dealt += 'Poison: ' + str(poison_damage_dealt) + '\n'

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
	$FireballTimer.start(current_fireball_cooldown)
	if closest_enemy.enemy:
		for i in range(fireball_count):
			var shift = 0 if i == 0 else randi_range(-20, 20)
			var fireball_instance = fireball_scene.instantiate()
			fireball_instance.global_position = global_position
			fireball_instance.direction = closest_enemy.direction.rotated(deg_to_rad(shift))
			fireball_instance.damage = fireball_damage
			var sums = calculate_weapon_level('fireball')
			fireball_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			get_parent().add_child(fireball_instance)
			await get_tree().create_timer(0.05).timeout

func _on_thunder_timer_timeout():
	$ThunderTimer.start(current_thunder_cooldown)
	for i in range(thunder_count):
		var selected_enemy = _get_random_enemy()
		if selected_enemy.enemy:
			var thunder_instance = thunder_scene.instantiate()
			thunder_instance.global_position = selected_enemy.enemy.global_position
			thunder_instance.damage = thunder_damage
			var sums = calculate_weapon_level('thunder')
			thunder_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			get_parent().add_child(thunder_instance)
			await get_tree().create_timer(0.10).timeout

func _on_laser_timer_timeout():
	$LaserTimer.start(current_laser_cooldown)
	for i in range(laser_count):
		var selected_enemy = _get_random_enemy()
		if selected_enemy.enemy:
			var laser_instance = laser_scene.instantiate()
			laser_instance.direction = selected_enemy.direction
			laser_instance.damage = laser_damage
			var sums = calculate_weapon_level('laser')
			laser_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			add_child(laser_instance)
			await get_tree().create_timer(0.15).timeout

func _on_void_timer_timeout():
	$VoidTimer.start(current_void_cooldown)
	var void_instance = void_scene.instantiate()
	void_instance.damage = void_damage
	void_instance.aoe = void_aoe
	var sums = calculate_weapon_level('void')
	void_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
	add_child(void_instance)

func _on_poison_timer_timeout():
	$PoisonTimer.start(current_poison_cooldown)
	for i in range(poison_count):
		var selected_enemy = _get_random_enemy()
		if selected_enemy.enemy:
			var poison_instance = poison_scene.instantiate()
			poison_instance.global_position = ((selected_enemy.enemy.global_position - global_position) / 1.3) + global_position
			poison_instance.damage = poison_damage
			poison_instance.aoe = poison_aoe
			var sums = calculate_weapon_level('poison')
			poison_instance.is_max_level = sums.sum_current_level >= sums.sum_max_level
			get_parent().add_child(poison_instance)
			await get_tree().create_timer(0.15).timeout

# health interation functions
func heal(amount):
	play_sound(sound_scene, heal_sound)

	health = min(health + amount, MAX_HEALTH)

func take_damage(amount):
	play_sound(sound_scene, hurt_sound)

	health -= amount
	if health <= 0:
		get_tree().change_scene_to_file("res://Menu.tscn")

# leveling functions
func _get_upgrades():
	var upgrade_count = 3

	var primary_upgrades = upgrades.filter(func(u): return u.current_level < u.max_level)
	var variant_upgrades = upgrades.filter(func(u): return u.type == 'weapon' and u.has('upgrades') and u.upgrades.any(func(v): return v.current_level < v.max_level))
	var filtered_variant_upgrades = []
	for v in variant_upgrades:
		if not v.current_level < v.max_level:
			for u in v.upgrades:
				if u.current_level < u.max_level:
					filtered_variant_upgrades.append(u)

	var filtered_upgrades = primary_upgrades + filtered_variant_upgrades
	filtered_upgrades.shuffle()

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

func level_up():
	play_sound(fixed_sound_scene, level_up_sound)

	current_level += 1
	_get_upgrades()
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
	fireball_damage += 1

func upgrade_atk_damage_thunder():
	thunder_damage += 1

func upgrade_atk_damage_laser():
	laser_damage += 1

func upgrade_atk_damage_void():
	void_damage += 2

func upgrade_atk_damage_poison():
	poison_damage += 2

func upgrade_atk_damage_all():
	if not buff_icons.has('atk_damage'):
		buff_icons.append('atk_damage')
	upgrade_atk_damage_fireball()
	upgrade_atk_damage_thunder()
	upgrade_atk_damage_laser()
	upgrade_atk_damage_void()
	upgrade_atk_damage_poison()

func upgrade_atk_speed_all():
	if not buff_icons.has('atk_speed'):
		buff_icons.append('atk_speed')
	# everything here is dealt in percentage,
	# since the variables bonus_<weapon>_cooldown is a percentage from 0 to 1
	# i.e. "bonus_fireball_cooldown + 0.05" will increase atk speed of fireballs by 5%
	bonus_fireball_cooldown = bonus_fireball_cooldown + 0.05
	bonus_thunder_cooldown = bonus_thunder_cooldown + 0.05
	bonus_laser_cooldown = bonus_laser_cooldown + 0.05
	bonus_void_cooldown = bonus_void_cooldown + 0.05
	bonus_poison_cooldown = bonus_poison_cooldown + 0.05

func upgrade_atk_count_fireball():
	fireball_count += 1

func upgrade_atk_count_thunder():
	thunder_count += 1

func upgrade_atk_count_laser():
	laser_count += 1

func upgrade_atk_count_poison():
	poison_count += 1

func upgrade_atk_count_all():
	if not buff_icons.has('atk_count'):
		buff_icons.append('atk_count')
	upgrade_atk_count_fireball()
	upgrade_atk_count_thunder()
	upgrade_atk_count_laser()
	upgrade_atk_count_poison()

func upgrade_aoe_void():
	void_aoe += 1

func upgrade_aoe_poison():
	poison_aoe += 1

func upgrade_health():
	if not buff_icons.has('health'):
		buff_icons.append('health')
	MAX_HEALTH += 20
	health = min(health + 20, MAX_HEALTH)

func upgrade_move_speed():
	if not buff_icons.has('move_speed'):
		buff_icons.append('move_speed')
	# FIXME: remove the min. debug purposes
	current_speed = min(current_speed + 20, 200)

func get_weapon_fireball():
	$FireballTimer.start(current_thunder_cooldown)
	weapon_icons.append('fireball')

func get_weapon_thunder():
	$ThunderTimer.start(current_thunder_cooldown)
	weapon_icons.append('thunder')

func get_weapon_laser():
	$LaserTimer.start(current_laser_cooldown)
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
