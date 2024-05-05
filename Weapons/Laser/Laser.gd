extends Node2D

var sound_scene = preload("res://SFX/Sound.tscn")
var sound = preload("res://SFX/laser_sound.wav")

var direction
var damage

var is_max_level = false

func _ready():
	play_sound()

	if is_max_level:
		$Particle2.visible = true
		damage *= 1.5 # FIXME: bad balancing
	$RayCast.target_position = direction * 550
	$Particle.position = direction * 40
	$Particle.direction = direction
	$Particle2.position = direction * 40
	$Particle2.direction = direction

func _process(delta):
	while $RayCast.is_colliding():
		var body = $RayCast.get_collider()
		if body and body.is_in_group('enemy'):
			body.take_damage('laser', ceil(damage))
		$RayCast.add_exception(body)
		$RayCast.force_raycast_update()

func _on_expiration_timer_timeout():
	queue_free()

func play_sound():
	var sound_instance = sound_scene.instantiate()
	sound_instance.stream = sound
	sound_instance.global_position = global_position
	get_parent().add_child(sound_instance)
