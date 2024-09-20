extends Area2D

var contact = 0
var timer_start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$GPUParticles2D.emitting = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(_body):
	if contact == 0:
		$AnimatedSprite2D.play('angry')
		$GPUParticles2D.emitting = true
		contact = 1
	if timer_start:
		$Timer.stop()
		timer_start=false

func _on_body_exited(_body):
	$Timer.start()
	timer_start = true

func _on_timer_timeout() -> void:
	$GPUParticles2D.emitting = false
	$AnimatedSprite2D.play('happy')
	contact = 0
	$Timer.stop()
	timer_start=false
