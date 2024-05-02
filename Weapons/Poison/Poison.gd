extends Area2D

var sound_scene = preload("res://SFX/Sound.tscn")
var sound = preload("res://SFX/poison_sound.wav")

var radius = 40
var aoe
var aoe_multiplier

var damage

var is_max_level = false

func _ready():
	play_sound()

	if is_max_level:
		aoe_multiplier = 7
		$CPUParticles2D.color = 'ffbf00'
	else:
		aoe_multiplier = 4
		$CPUParticles2D.color = '77ff00'

	radius += aoe * aoe_multiplier
	$CPUParticles2D.scale = Vector2(radius/40.0, radius/40.0)
	$CollisionShape2D.shape.radius = radius + 10

func _on_damage_timer_timeout():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group('enemy'):
			body.take_damage('poison', damage/2)

func _on_expiration_timer_timeout():
	queue_free()

func play_sound():
	var sound_instance = sound_scene.instantiate()
	sound_instance.stream = sound
	sound_instance.global_position = global_position
	get_parent().add_child(sound_instance)
