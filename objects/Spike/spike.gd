extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.set_player_state(Game.player_state.DYING)
