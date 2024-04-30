extends Node2D

var direction
var damage

var is_max_level = false

func _ready():
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
			body.take_damage(damage)
		$RayCast.add_exception(body)
		$RayCast.force_raycast_update()

func _on_expiration_timer_timeout():
	queue_free()
