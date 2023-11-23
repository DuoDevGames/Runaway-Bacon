extends Area2D

func _on_body_entered(body):
	if body.name == 'Lombinho':
		body.velocity.y = body.JUMP_FORCE
		$"../AnimatedSprite2D".play("damage")

