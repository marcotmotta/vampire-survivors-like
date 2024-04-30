extends Area2D

var damage

var is_max_level = false

func _ready():
	if is_max_level:
		$Particle.visible = false
		$Particle2.visible = true
		$Particle2.emitting = true
		damage *= 1.5 # FIXME: bad balancing
	else:
		$Particle.visible = true
		$Particle2.visible = false
		$Particle.emitting = true

func _on_body_entered(body):
	if body.is_in_group('enemy'):
		body.take_damage(damage)
		$CollisionShape2D.set_deferred('disabled', true)

func _on_cpu_particles_2d_finished():
	queue_free()
