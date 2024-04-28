extends Node2D

var direction
var damage

func _ready():
	$RayCast.target_position = direction * 550
	$CPUParticles2D.position = direction * 40
	$CPUParticles2D.direction = direction

func _process(delta):
	while $RayCast.is_colliding():
		var body = $RayCast.get_collider()
		if body and body.is_in_group('enemy'):
			body.take_damage(damage)
		$RayCast.add_exception(body)
		$RayCast.force_raycast_update()

func _on_expiration_timer_timeout():
	queue_free()
