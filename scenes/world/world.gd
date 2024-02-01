extends Node2D

#func _input(event):
	#if event is InputEvent and event.is_pressed():
		#if event.keycode == KEY_R:
			#Game.resetsNo += 1
			#get_tree().reload_current_scene()

func _on_finish_line_body_entered(_body):
	Game.resetsNo = 0
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
