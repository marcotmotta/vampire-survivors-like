extends Area2D

var radius = 100
var aoe

var damage

func _ready():
	radius += aoe * 20 # +20% radius by aoe level
	$CPUParticles2D.scale = Vector2(radius/100.0, radius/100.0)
	$CollisionShape2D.shape.radius = radius + 40

func _on_damage_timer_timeout():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group('enemy'):
			body.take_damage(damage/2)

func _on_expiration_timer_timeout():
	queue_free()
