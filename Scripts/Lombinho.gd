extends CharacterBody2D

signal killed

@export var SPEED : int = 200 * Global.vel_corrida
@export var JUMP_FORCE : int = 360
@export var GRAVITY : int = 900
var knockback_vector := Vector2.ZERO

@onready var remote_transform := $RemoteTransform2D as RemoteTransform2D
@onready var anim := $AnimatedSprite2D as AnimatedSprite2D

var dead : bool = false

func _physics_process(delta):
	
	var direction = Input.get_axis("Left", "Right")
	
	if direction:
		velocity.x = direction * SPEED * Global.vel_corrida
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
	#if Input.is_action_just_pressed("Jump") and is_on_floor():
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y -= JUMP_FORCE
		$AnimatedSprite2D.play("Jump")
		SoundsController.play_jump_sound()
	
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
	
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector
	
	move_and_slide()

func die():
	Global.palhas = 0
	Global.coracoes = 3
	Global.score = 0
	queue_free()

func dano(knockback_force := Vector2.ZERO, duration = 0.25):
	Global.coracoes -= 1
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		
		var knockback_tween := get_tree().create_tween()
		knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
		anim.modulate = Color(1,0,0,1)
		knockback_tween.parallel().tween_property(anim, "modulate", Color(1,1,1,1), duration)
	if Global.coracoes <= 0:
		die()

func follow_camera(camera):
	var camera_path = camera.get_path()
	remote_transform.remote_path = camera_path

func _on_hurtbox_body_entered(body):
	if $ray_right.is_colliding():
		dano(Vector2(-600,-320))
	elif $ray_left.is_colliding():
		dano(Vector2(600,-320))
