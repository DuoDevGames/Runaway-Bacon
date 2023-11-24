extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var wall_detector := $RayCast2D as RayCast2D
@onready var texture := $AnimatedSprite2D

var direction := -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	if not is_on_floor():
		velocity.y = gravity * delta
		
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1
		
	if direction == 1:
		texture.flip_h = true
	else:
		texture.flip_h = false
		
		
	velocity.x = direction * SPEED


	move_and_slide()
