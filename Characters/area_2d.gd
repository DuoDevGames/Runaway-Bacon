extends Area2D

func _ready():
	pass
	
func _process(_delta):
	pass
	
func _on_body_entered(_body):
	if Global.meia == 0:
		if Global.primeiro_dialogo_coitadinho == 0:
			Dialogic.start("Coitadinho 1")
			Global.primeiro_dialogo_coitadinho = 1
	if Global.meia == 1:
		if Global.primeiro_dialogo_coitadinho == 1:
			Dialogic.start("Coitadinho 2")
			Global.parede = false
			Global.primeiro_dialogo_coitadinho = 2
