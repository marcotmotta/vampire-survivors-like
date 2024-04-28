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
				'max_level': 5,
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

var buttons = [{},{},{}]

var weapon_icons = []
var buff_icons = []

# health
var MAX_HEALTH = 100
var health = MAX_HEALTH

# movement speed logic
var base_speed = 200
var current_speed = base_speed

# fireball logic
var fireball_scene = preload("res://Weapons/Fireball.tscn")
var fireball_icon = preload("res://Weapons/fireball_icon.png")
var fireball_damage = 10
var base_fireball_cooldown = 2 # seconds
var bonus_fireball_cooldown = 0 # percentage (0 - 1)
var current_fireball_cooldown = base_fireball_cooldown
var fireball_count = 1

# thunder logic
var thunder_scene = preload("res://Weapons/Thunder.tscn")
var thunder_icon = preload("res://Weapons/thunder_icon.png")
var thunder_damage = 10
var base_thunder_cooldown = 3 # seconds
var bonus_thunder_cooldown = 0 # percentage (0 - 1)
var current_thunder_cooldown = base_thunder_cooldown
var thunder_count = 1

# laser logic
var laser_scene = preload("res://Weapons/Laser.tscn")
var laser_icon = preload("res://Weapons/laser_icon.png")
var laser_damage = 10
var base_laser_cooldown = 3 # seconds
var bonus_laser_cooldown = 0 # percentage (0 - 1)
var current_laser_cooldown = base_laser_cooldown
var laser_count = 1

# void logic
var void_scene = preload("res://Weapons/Void.tscn")
var void_icon = preload("res://Weapons/void_icon.png")
var void_damage = 10
var base_void_cooldown = 7 # seconds
var bonus_void_cooldown = 0 # percentage (0 - 1)
var current_void_cooldown = base_void_cooldown
var void_aoe = 0

# exp and leveling
# exp needed to level = base_exp + current_level * exp_level_ratio
var current_level = 1
var base_exp = 1
var exp_level_ratio = 3
var current_exp = 0

var kills = 0

func _ready():
	randomize()

	# FIXME: set the starting weapon. debug purposes
	get_weapon_fireball()
	#get_weapon_void()

func get_input():
	var input_direction = Input.get_vector("a", "d", "w", "s")
	velocity = input_direction * current_speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func calculate_icon_position():
	for i in range(weapon_icons.size()):
		var icon = $CanvasLayer/Control.get_node(weapon_icons[i] + 'Icon')
		icon.position = Vector2(20 + i * 60, 20)
		icon.visible = true
		var label = $CanvasLayer/Control.get_node(weapon_icons[i] + 'Label')
		var upgrade = upgrades.filter(func(u): return u.upgrade == weapon_icons[i])[0]
		var sum_max_level = upgrade.max_level
		sum_max_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.max_level, sum_max_level)
		var sum_current_level = upgrade.current_level
		sum_current_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.current_level, sum_current_level)
		label.text = str(sum_current_level)
		if sum_current_level >= sum_max_level:
			label.label_settings.font_color = 'ffd600'
		label.position = Vector2(20 + i * 60, 70)
		label.visible = true

	for i in range(buff_icons.size()):
		var icon = $CanvasLayer/Control.get_node(buff_icons[i] + 'Icon')
		icon.position = Vector2(20 + i * 50, 100)
		icon.visible = true
		var label = $CanvasLayer/Control.get_node(buff_icons[i] + 'Label')
		var upgrade = upgrades.filter(func(u): return u.upgrade == buff_icons[i])[0]
		label.text = str(upgrade.current_level)
		if upgrade.current_level >= upgrade.max_level:
			label.label_settings.font_color = 'ffd600'
		label.position = Vector2(20 + i * 50, 142)
		label.visible = true

func _process(delta):
	# health bar
	$HealthBar.max_value = MAX_HEALTH
	$HealthBar.value = health

	# canculte atk speed and cooldown
	current_fireball_cooldown = base_fireball_cooldown * (1 - bonus_fireball_cooldown)
	current_thunder_cooldown = base_thunder_cooldown * (1 - bonus_thunder_cooldown)
	current_laser_cooldown = base_laser_cooldown * (1 - bonus_laser_cooldown)
	current_void_cooldown = base_void_cooldown * (1 - bonus_void_cooldown)

	# icons
	calculate_icon_position()

	# show stats
	var stats = ''
	stats += 'level: ' + str(current_level) + '\n'
	stats += 'exp: ' + str(current_exp) + '/' + str(base_exp + current_level * exp_level_ratio) + '\n'
	stats += '\n'
	stats += 'health: ' + str(health) + '\n'
	stats += 'movement speed: ' + str(current_speed) + '\n'
	stats += 'fireball cd: ' + str(current_fireball_cooldown) + '\n'
	stats += 'fireball count: ' + str(fireball_count) + '\n'
	stats += 'thunder cd: ' + str(current_thunder_cooldown) + '\n'
	stats += 'thunder count: ' + str(thunder_count) + '\n'
	stats += 'laser cd: ' + str(current_laser_cooldown) + '\n'
	stats += 'laser count: ' + str(laser_count) + '\n'
	stats += 'void cd: ' + str(current_void_cooldown) + '\n'

	$CanvasLayer/Control/StatsLabel.text = stats

	$CanvasLayer/Control/KillsLabel.text = 'kills: ' + str(kills)

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
			var upgrade = upgrades.filter(func(u): return u.upgrade == 'fireball')[0]
			var sum_max_level = upgrade.max_level
			sum_max_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.max_level, sum_max_level)
			var sum_current_level = upgrade.current_level
			sum_current_level = upgrade.upgrades.reduce(func(accum, u): return accum + u.current_level, sum_current_level)
			if sum_current_level >= sum_max_level:
				fireball_instance.is_max_level = true
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
			get_parent().add_child(thunder_instance)
			await get_tree().create_timer(0.15).timeout

func _on_laser_timer_timeout():
	$LaserTimer.start(current_laser_cooldown)
	for i in range(laser_count):
		var selected_enemy = _get_random_enemy()
		if selected_enemy.enemy:
			var laser_instance = laser_scene.instantiate()
			laser_instance.direction = selected_enemy.direction
			laser_instance.damage = laser_damage
			add_child(laser_instance)
			await get_tree().create_timer(0.15).timeout

func _on_void_timer_timeout():
	$VoidTimer.start(current_void_cooldown)
	var void_instance = void_scene.instantiate()
	void_instance.damage = void_damage
	void_instance.aoe = void_aoe
	add_child(void_instance)

# health interation functions
func heal(amount):
	health = min(health + amount, MAX_HEALTH)

func take_damage(amount):
	health -= amount

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
			#button.get_node('Sprite2D').texture = selected_upgrade.icon
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
			#button.get_node('Sprite2D').texture = null
			button.icon = null
			buttons[i] = {}
			button.disabled = true

func level_up():
	current_level += 1
	_get_upgrades()
	$CanvasLayer/Control/UpgradeList.visible = true
	get_tree().paused = true

func get_exp(amount):
	current_exp += amount
	if current_exp >= base_exp + current_level * exp_level_ratio: # simple level up logic
		current_exp = 0
		level_up()

# FIXME: remove this - debug only
func _unhandled_input(event):
	if Input.is_action_just_pressed("f1"):
		$CanvasLayer/Control/UpgradeList.visible = true
		get_tree().paused = true

# upgrade functions
func upgrade_atk_damage_fireball():
	fireball_damage += 1

func upgrade_atk_damage_thunder():
	thunder_damage += 1

func upgrade_atk_damage_laser():
	laser_damage += 1

func upgrade_atk_damage_void():
	void_damage += 1

func upgrade_atk_damage_all():
	if not buff_icons.has('atk_damage'):
		buff_icons.append('atk_damage')
	upgrade_atk_damage_fireball()
	upgrade_atk_damage_thunder()
	upgrade_atk_damage_laser()
	upgrade_atk_damage_void()

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

func upgrade_atk_count_fireball():
	fireball_count += 1

func upgrade_atk_count_thunder():
	thunder_count += 1

func upgrade_atk_count_laser():
	laser_count += 1

func upgrade_atk_count_all():
	if not buff_icons.has('atk_count'):
		buff_icons.append('atk_count')
	upgrade_atk_count_fireball()
	upgrade_atk_count_thunder()
	upgrade_atk_count_laser()

func upgrade_aoe_void():
	void_aoe += 1

func upgrade_health():
	if not buff_icons.has('health'):
		buff_icons.append('health')
	MAX_HEALTH += 20
	health = min(health + 20, MAX_HEALTH)

func upgrade_move_speed():
	if not buff_icons.has('move_speed'):
		buff_icons.append('move_speed')
	# FIXME: remove the min. debug purposes
	current_speed = min(current_speed + 50, 400)

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

# upgrade buttons
func _on_button_0_pressed():
	buttons[0].callable.call()
	buttons[0].current_level += 1
	get_tree().paused = false
	$CanvasLayer/Control/UpgradeList.visible = false

func _on_button_1_pressed():
	buttons[1].callable.call()
	buttons[1].current_level += 1
	get_tree().paused = false
	$CanvasLayer/Control/UpgradeList.visible = false

func _on_button_2_pressed():
	buttons[2].callable.call()
	buttons[2].current_level += 1
	get_tree().paused = false
	$CanvasLayer/Control/UpgradeList.visible = false
