extends Area2D

var sound_scene = preload("res://SFX/Sound.tscn")
var sound = preload("res://SFX/thunder_sound.wav")

var damage

var is_max_level = false

func _ready():
	play_sound()

	if is_max_level:
		$Particle.visible = false
		$Particle2.visible = true
		$Particle2.emitting = true
		damage *= 2 # FIXME: bad balancing
	else:
		$Particle.visible = true
		$Particle2.visible = false
		$Particle.emitting = true

func _on_body_entered(body):
	if body.is_in_group('enemy'):
		body.take_damage('thunder', damage)
		$CollisionShape2D.set_deferred('disabled', true)

func _on_cpu_particles_2d_finished():
	queue_free()

func play_sound():
	var sound_instance = sound_scene.instantiate()
	sound_instance.stream = sound
	sound_instance.global_position = global_position
	get_parent().add_child(sound_instance)
