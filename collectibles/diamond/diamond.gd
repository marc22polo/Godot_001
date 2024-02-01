extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		var tween_pos = get_tree().create_tween()
		var tween_mod = get_tree().create_tween()
		tween_pos.tween_property(self, "position", position - Vector2(0,25), 0.35)
		tween_mod.tween_property(self, "modulate:a", 0, 0.2)
		tween_pos.tween_callback(queue_free)
		tween_mod.tween_callback(queue_free)
