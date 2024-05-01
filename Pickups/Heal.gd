extends Area2D

var heal_amount = 100

func _on_body_entered(body):
	if body.is_in_group('player'):
		body.heal(heal_amount)
		queue_free()

func _on_expiration_timer_timeout():
	queue_free()
