extends Area2D

func _on_body_entered(body):
	if body.name == 'Lombinho':
		body.velocity.y -= body.JUMP_FORCE
		owner.tomoudano = true
		owner.dano -= 1

