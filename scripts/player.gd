extends CharacterBody2D

@onready var game_manager: Node = %"Game Manager"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 400
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and not game_manager.in_convo:
		animated_sprite_2d.play("jump")
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip h for movement left right
	if not game_manager.in_convo:
		if direction > 0:
			animated_sprite_2d.flip_h=false
		if direction < 0:
			animated_sprite_2d.flip_h=true
	
	#Run/Idle animations
	if not game_manager.in_convo:
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("idle")
			if direction !=0:
				animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("jump")
	else:
		animated_sprite_2d.play("idle")
	
	if direction and not game_manager.in_convo:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		#if game_manager.in_convo:
			var tree = get_tree()
			if tree != null:
				tree.change_scene_to_file("res://scenes/startmain.tscn")
				print(GameManagerss.score)
			else:
				pass
		#else:
			#game_manager.in_convo = false
