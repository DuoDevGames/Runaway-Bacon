extends CharacterBody2D


var speed = -75
var dano = 5
var tomoudano = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = false

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	if tomoudano:
		$AnimatedSprite2D.play("damage")
		await get_tree().create_timer(0.3).timeout
		tomoudano = false
	else:
		$AnimatedSprite2D.play("default")
	
	if dano == 0:
		queue_free()

	if not is_on_floor():
		velocity.y = gravity * delta
	
	if $Obstaculo.is_colliding() && is_on_floor():
		flip()
	
	if !$Chao.is_colliding() && is_on_floor():
		flip()
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1
