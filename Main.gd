extends Node2D

var normal_enemy_scene = preload("res://Enemies/NormalEnemy.tscn")
var big_enemy_scene = preload("res://Enemies/BigEnemy.tscn")
var small_enemy_scene = preload("res://Enemies/SmallEnemy.tscn")
var mini_boss_enemy_scene = preload("res://Enemies/MiniBossEnemy.tscn")

var enemy_spawn_timer = 2 # in seconds

var enemy_spawn_level = 1

var chance_big_enemy = 0 # percentage (0 - 1)
var chance_small_enemy = 0 # percentage (0 - 1)
var chance_mini_boss_enemy = 0 # percentage (0 - 1)

var chance_multiple_enemies = 0 # percentage (0 - 1)
var multiple_enemies_count = 1

func _ready():
	randomize()

func _choose_enemy():
	var chance = randf()
	if chance <= chance_big_enemy:
		return big_enemy_scene.instantiate()
	elif chance <= chance_big_enemy + chance_small_enemy:
		return small_enemy_scene.instantiate()
	elif chance <= chance_big_enemy + chance_small_enemy + chance_mini_boss_enemy:
		return mini_boss_enemy_scene.instantiate()
	return normal_enemy_scene.instantiate()

func _on_spawn_timer_timeout():
	# calculate chance of double enemy
	for i in range(multiple_enemies_count if randf() <= chance_multiple_enemies else 1):
		# choose spawn point
		while(true):
			var spawn_point = Vector2(randi_range(30, 1100), randi_range(30, 600))
			if (spawn_point - get_node('Player').position).length() > 400:
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
		chance_big_enemy = 0.3
		chance_small_enemy = 0.2
		chance_multiple_enemies = 0.4
		multiple_enemies_count = 3
	# up to level 4 at level 30
	elif enemy_spawn_level <= 3 and get_node('Player').current_level >= 30:
		enemy_spawn_level += 1
		chance_big_enemy = 0.3
		chance_small_enemy = 0.2
		chance_mini_boss_enemy = 0.03
		chance_multiple_enemies = 0.6
		multiple_enemies_count = 4
	# up to level 5 at level 40
	elif enemy_spawn_level <= 3 and get_node('Player').current_level >= 30:
		enemy_spawn_level += 1
		chance_big_enemy = 0.4
		chance_small_enemy = 0.3
		chance_mini_boss_enemy = 0.05
		chance_multiple_enemies = 0.8
		multiple_enemies_count = 10
	# up to level 6 at level 50
	elif enemy_spawn_level <= 3 and get_node('Player').current_level >= 30:
		enemy_spawn_level += 1
		chance_big_enemy = 0.4
		chance_small_enemy = 0.4
		chance_mini_boss_enemy = 0.1
		chance_multiple_enemies = 1
		multiple_enemies_count = 14
	# up to level 7 at level 60
	elif enemy_spawn_level <= 3 and get_node('Player').current_level >= 30:
		enemy_spawn_level += 1
		chance_big_enemy = 0.4
		chance_small_enemy = 0.4
		chance_mini_boss_enemy = 0.1
		chance_multiple_enemies = 1
		multiple_enemies_count = 30

	# reduce enemy spawn timer
	enemy_spawn_timer = max(enemy_spawn_timer - 0.05, 0.3)
