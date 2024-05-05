extends Area2D

var sound_scene = preload("res://SFX/Sound.tscn")
var sound = preload("res://SFX/fireball_sound.wav")

var direction
var speed = 250
var damage

var is_max_level = false

func _ready():
	play_sound()

	if is_max_level:
		$Particle.visible = false
		$Particle2.visible = true

func _physics_process(delta):
	position = position + direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group('enemy'):
		body.take_damage('fireball', ceil(damage))
		if not is_max_level:
			queue_free()

func _on_expiration_timer_timeout():
	queue_free()

func play_sound():
	var sound_instance = sound_scene.instantiate()
	sound_instance.stream = sound
	sound_instance.global_position = global_position
	get_parent().add_child(sound_instance)
