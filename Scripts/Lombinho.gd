extends CharacterBody2D

signal killed

@export var SPEED : int = 200
@export var JUMP_FORCE : int = 360
@export var GRAVITY : int = 900

@onready var gos = $"../HUD/GameOverScreen"

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
	
	#ROTATE
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
	
	#JUMP
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= JUMP_FORCE
		$AnimatedSprite2D.play("Jump")
	
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
	
	move_and_slide()

func die():
	get_tree().reload_current_scene()
	Global.palhas = 0
	Global.coracoes = 3
	Global.score = 0
	queue_free()
	await get_tree().create_timer(1.5).timeout
	gos.visible = true
