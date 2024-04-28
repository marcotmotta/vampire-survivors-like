extends Area2D

var damage

func _ready():
	$CPUParticles2D.emitting = true

func _on_body_entered(body):
	if body.is_in_group('enemy'):
		body.take_damage(damage)
		$CollisionShape2D.set_deferred('disabled', true)

func _on_cpu_particles_2d_finished():
	queue_free()
