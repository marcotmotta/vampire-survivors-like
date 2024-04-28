extends CharacterBody2D

var damage_number_scene = preload("res://Enemies/DamageNumber.tscn")

var player

var speed
var direction

var MAX_HEALTH
var health

var damage

var exp

# heal (or item?) drop
var heal_scene = preload("res://Heal.tscn")
var chance_to_drop = 0.01 # percent (0 - 1)

func _ready():
	randomize()
	player = get_parent().get_node('Player')

	set_stats()

# to be overwritten
func set_stats():
	pass

func get_input():
	direction = (player.position - position).normalized()
	velocity = direction * speed

func _process(delta):
	$HealthBar.max_value = MAX_HEALTH
	$HealthBar.value = health

func _physics_process(delta):
	get_input()
	move_and_slide()

	if direction.x < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false

func take_damage(dmg):
	var damage_number_instance = damage_number_scene.instantiate()
	damage_number_instance.damage = dmg
	damage_number_instance.global_position = global_position
	get_parent().add_child(damage_number_instance)
	health -= dmg
	if health <= 0:
		get_parent().enemy_died(exp)
		if randf() <= chance_to_drop:
			var heal_instance = heal_scene.instantiate()
			heal_instance.global_position = global_position
			get_parent().add_child(heal_instance)
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group('player'):
		body.take_damage(damage)
		queue_free()
