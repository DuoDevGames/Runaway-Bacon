extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$GPUParticles2D.emitting = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	$AnimatedSprite2D.play('angry')
	$GPUParticles2D.emitting = true

func _on_body_exited(body):
	await get_tree().create_timer(5).timeout
	$GPUParticles2D.emitting = false
	$AnimatedSprite2D.play('happy')
	
