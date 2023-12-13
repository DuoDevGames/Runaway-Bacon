extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.get_name() == "Lombinho":
		body.die()
	
	if body.get_name() == "Panceta":
		body.die()
	
	if body.get_name() == "Toicinho":
		body.die()
