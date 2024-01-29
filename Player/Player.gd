extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var died = false
@onready var anim = get_node("AnimationPlayer");

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var direction = 0
	if is_on_wall():
		if not died:
			anim.play("Death")
			died = true
		else:
			if not anim.is_playing():
				Game.resetsNo += 1
				get_tree().reload_current_scene()
	else:
		direction = 1
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")

	# handle the movement/deceleration.
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0 and not died:
			anim.play("Idle")
	if velocity.y > 0 and not died:
		anim.play("Fall")
	
	if direction > 0:
		move_and_slide()
