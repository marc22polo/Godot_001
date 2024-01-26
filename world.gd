extends Node2D

func _input(event):
	if event is InputEvent and event.is_pressed():
		if event.keycode == KEY_R:
			Game.resetsNo += 1
			get_tree().reload_current_scene()
