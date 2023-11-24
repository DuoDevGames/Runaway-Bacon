extends CharacterBody2D


const SPEED = 100.0
var direction := 1
var fox_hp = 100

@onready var wall_detector := $RayCast2D as RayCast2D
@onready var texture := $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1
	
	if direction == 1:
		texture.flip_h = true
	else:
		texture.flip_h = false

	velocity.x = direction * SPEED 

	move_and_slide()
	



func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "damage":
		if(fox_hp > 0):
			fox_hp = fox_hp - 21
			$AnimatedSprite2D.play("default")
		else:
			queue_free()
