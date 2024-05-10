extends Node2D

var damage

func _ready():
	randomize()

	position = Vector2(position.x + randi_range(-15, 15), position.y + randi_range(-15, 15))

	var new_label_settings = $Label.label_settings.duplicate()
	$Label.label_settings = new_label_settings

	$Label.text = str(damage)

	if damage >= 100: # gold
			$Label.label_settings.font_color = 'ffd600'
			self.scale = Vector2(1.4, 1.4)
	elif damage >= 25: # blue
			$Label.label_settings.font_color = '00e1ff'
			self.scale = Vector2(1.2, 1.2)
	else: # white
		$Label.label_settings.font_color = 'cccccc'

func _on_expiration_timer_timeout():
	queue_free()
