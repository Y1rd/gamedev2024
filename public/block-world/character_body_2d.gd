# Extends Player
extends CharacterBody2D

# Variables
const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Movement, also runs on every frame
func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jumping
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Left/Right Movement
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move!
	move_and_slide()
	
	# Detect Collision with Lava Tiles
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		# Kill Player
		if collision.get_collider().is_in_group("lava"):
			if get_tree():
				get_tree().reload_current_scene()
		# These two are only for the level 1 tutorial
		
