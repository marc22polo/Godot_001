extends Node2D

func _ready():
	$AnimationPlayer.play("beat")

func _on_b_quit_pressed():
	get_tree().quit();

func _on_b_play_pressed():
	get_tree().change_scene_to_file("res://scenes/world/world.tscn");
