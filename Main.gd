extends Node2D

var normal_enemy_scene = preload("res://Enemies/Normal/NormalEnemy.tscn")
var big_enemy_scene = preload("res://Enemies/Big/BigEnemy.tscn")
var small_enemy_scene = preload("res://Enemies/Small/SmallEnemy.tscn")
var mini_boss_enemy_scene = preload("res://Enemies/MiniBoss/MiniBossEnemy.tscn")
var big_mini_boss_enemy_scene = preload("res://Enemies/BigMiniBoss/BigMiniBossEnemy.tscn")
var boss_enemy_scene = preload("res://Enemies/Boss/BossEnemy.tscn")

var enemy_spawn_timer = 2 # in seconds

var enemy_spawn_level = 1

var chance_big_enemy = 0 # percentage (0 - 1)
var chance_small_enemy = 0 # percentage (0 - 1)
var chance_mini_boss_enemy = 0 # percentage (0 - 1)
var chance_big_mini_boss_enemy = 0 # percentage (0 - 1)
var chance_boss_enemy = 0 # percentage (0 - 1)

var chance_multiple_enemies = 0 # percentage (0 - 1)
var multiple_enemies_count = 1

var minimum_spawn_time = 0.3

const MAX_NUMBER_OF_ENEMIES = 165

func _ready():
	randomize()

func add_weapon_damage(source, dmg):
	get_node('Player').upgrades[source].stats.damage_dealt += dmg

func _choose_enemy():
	var chance = randf()
	if chance <= chance_big_enemy:
		return big_enemy_scene.instantiate()
	elif chance <= chance_big_enemy + chance_small_enemy:
		return small_enemy_scene.instantiate()
	elif chance <= chance_big_enemy + chance_small_enemy + chance_mini_boss_enemy:
		return mini_boss_enemy_scene.instantiate()
	elif chance <= chance_big_enemy + chance_small_enemy + chance_mini_boss_enemy + chance_big_mini_boss_enemy:
		return big_mini_boss_enemy_scene.instantiate()
	elif chance <= chance_big_enemy + chance_small_enemy + chance_mini_boss_enemy + chance_big_mini_boss_enemy + chance_boss_enemy:
		return boss_enemy_scene.instantiate()
	return normal_enemy_scene.instantiate()

func _on_spawn_timer_timeout():
	var enemy_count = get_tree().get_nodes_in_group("enemy").size()
	if enemy_count < MAX_NUMBER_OF_ENEMIES:
		# calculate chance of multiple enemies
		for i in range(multiple_enemies_count if randf() <= chance_multiple_enemies else 1):
			# choose spawn point
			while(true):
				var spawn_point = Vector2(randi_range(30, 1100), randi_range(30, 600))
				if (spawn_point - get_node('Player').position).length() > 380:
					var enemy_instance = _choose_enemy()
					enemy_instance.global_position = spawn_point
					add_child(enemy_instance)
					break

	$SpawnTimer.start(enemy_spawn_timer)

# FIXME: temporary solution
func enemy_died(exp):
	# give exp to player
	var player = get_node('Player')
	player.get_exp(exp) 
	player.kills += 1

	# up to level 2 at level 10
	if enemy_spawn_level <= 1 and get_node('Player').current_level >= 10:
		enemy_spawn_level += 1
		chance_big_enemy = 0.2
		chance_multiple_enemies = 0.4
		multiple_enemies_count = 2
	# up to level 3 at level 20
	elif enemy_spawn_level <= 2 and get_node('Player').current_level >= 20:
		enemy_spawn_level += 1
		chance_big_enemy = 0.35
		chance_small_enemy = 0.2
		chance_multiple_enemies = 0.4
		multiple_enemies_count = 3
	# up to level 4 at level 30
	elif enemy_spawn_level <= 3 and get_node('Player').current_level >= 30:
		enemy_spawn_level += 1
		chance_big_enemy = 0.4
		chance_small_enemy = 0.2
		chance_mini_boss_enemy = 0.03
		chance_multiple_enemies = 0.6
		multiple_enemies_count = 4
	# up to level 5 at level 40
	elif enemy_spawn_level <= 4 and get_node('Player').current_level >= 40:
		enemy_spawn_level += 1
		chance_big_enemy = 0.4
		chance_small_enemy = 0.4
		chance_mini_boss_enemy = 0.05
		chance_multiple_enemies = 0.8
		multiple_enemies_count = 6
	# up to level 6 at level 50
	elif enemy_spawn_level <= 5 and get_node('Player').current_level >= 50:
		enemy_spawn_level += 1
		chance_big_enemy = 0.4
		chance_small_enemy = 0.4
		chance_mini_boss_enemy = 0.1
		chance_big_mini_boss_enemy = 0.03
		chance_multiple_enemies = 1
		multiple_enemies_count = 8
	# up to level 7 at level 60
	elif enemy_spawn_level <= 6 and get_node('Player').current_level >= 60:
		enemy_spawn_level += 1
		chance_big_enemy = 0.2
		chance_small_enemy = 0.5
		chance_mini_boss_enemy = 0.2
		chance_big_mini_boss_enemy = 0.05
		chance_multiple_enemies = 1
		multiple_enemies_count = 10
	# up to level 8 at level 70
	elif enemy_spawn_level <= 7 and get_node('Player').current_level >= 70:
		enemy_spawn_level += 1
		chance_big_enemy = 0.2
		chance_small_enemy = 0.3
		chance_mini_boss_enemy = 0.3
		chance_big_mini_boss_enemy = 0.1
		chance_multiple_enemies = 1
		multiple_enemies_count = 10
	# up to level 9 at level 80
	elif enemy_spawn_level <= 8 and get_node('Player').current_level >= 80:
		enemy_spawn_level += 1
		chance_big_enemy = 0
		chance_small_enemy = 0
		chance_mini_boss_enemy = 0
		chance_big_mini_boss_enemy = 0.4
		chance_boss_enemy = 0.6
		chance_multiple_enemies = 1
		multiple_enemies_count = 12

	# reduce enemy spawn timer
	enemy_spawn_timer = max(enemy_spawn_timer - 0.05, minimum_spawn_time)
