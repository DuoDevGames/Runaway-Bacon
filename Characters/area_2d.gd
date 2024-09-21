extends Area2D


func _ready():
	pass
	
func _process(_delta):
	pass
	
func _on_body_entered(_body):
	if Global.meia == 0:
		Dialogic.start("Coitadinho 1")
