extends Node2D

var damage

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

	position = Vector2(position.x + randi_range(-15, 15), position.y + randi_range(-15, 15))

	var new_label_settings = $Label.label_settings.duplicate()
	$Label.label_settings = new_label_settings

	$Label.text = str(damage)

	if damage >= 100: # gold
			$Label.label_settings.font_color = 'ffd600'
	elif damage >= 50: # blue
			$Label.label_settings.font_color = '00e1ff'
	else: # white
		$Label.label_settings.font_color = 'cccccc'

func _on_expiration_timer_timeout():
	queue_free()
