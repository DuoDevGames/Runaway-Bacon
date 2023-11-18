extends CharacterBody2D


@export var SPEED : int = 150
@export var JUMP_FORCE : int = 255
@export var GRAVITY : int = 900

func _physics_process(delta):
	
	
	var direction = Input.get_axis("Left", "Right")
	
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite2D.play("default")
	
	#GRAVITY
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		
	#DIRECTION
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
		
	#JUMP
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= JUMP_FORCE
		$AnimatedSprite2D.play("Jump")
	
	move_and_slide()
