extends Area2D

var direction
var speed = 280
var damage

var is_max_level = false

func _ready():
	look_at(position + direction)

	if is_max_level:
		damage *= 2
		damage += randi_range(0, 2)
		$Sprite.visible = false
		$Sprite2.visible = true
		$Particles.visible = false
		$Particles2.visible = true

func _physics_process(delta):
	position = position + direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group('enemy'):
		body.take_damage('arrow', ceil(damage))

func _on_expiration_timer_timeout():
	queue_free()
