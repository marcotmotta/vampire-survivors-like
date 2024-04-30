extends Area2D

var radius = 100
var aoe
var aoe_multiplier

var damage

var is_max_level = false

func _ready():
	if is_max_level:
		aoe_multiplier = 15
		$CPUParticles2D.color = 'ffe200'
	else:
		aoe_multiplier = 12
		$CPUParticles2D.color = 'c300ff'
	radius += aoe * aoe_multiplier
	$CPUParticles2D.scale = Vector2(radius/100.0, radius/100.0)
	$CollisionShape2D.shape.radius = radius + 30

func _on_damage_timer_timeout():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group('enemy'):
			body.take_damage(damage/2)

func _on_expiration_timer_timeout():
	queue_free()
