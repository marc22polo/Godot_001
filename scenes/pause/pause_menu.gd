extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	
func handle_esc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _on_btn_resume_pressed():
	resume()

func _on_btn_restart_pressed():
	Game.resetsNo += 1
	resume()
	get_tree().reload_current_scene()

func _on_btn_quit_pressed():
	get_tree().quit()

func _process(_delta):
	handle_esc()
