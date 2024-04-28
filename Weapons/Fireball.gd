extends Area2D

var direction
var speed = 350
var damage

var is_max_level = false

func _ready():
	if is_max_level:
		$Particle.visible = false
		$Particle2.visible = true

func _physics_process(delta):
	position = position + direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group('enemy'):
		body.take_damage(damage)
		if not is_max_level:
			queue_free()

func _on_expiration_timer_timeout():
	queue_free()
