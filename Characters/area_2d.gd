extends Area2D

var player_is_on_area = false

func _ready():
	$"Balao Sprite".hide()
	
func _process(_delta):
	if(player_is_on_area == true):
		if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
			if Global.meia == 0:
				$"Balao Sprite".hide()
				Dialogic.start("Coitadinho 1")
				player_is_on_area = false
			if Global.meia == 1:
				$"Balao Sprite".hide()
				if Global.primeiro_dialogo_coitadinho == 1:
					Dialogic.start("Coitadinho 2")
					Global.parede = false
					Global.primeiro_dialogo_coitadinho = 2
					player_is_on_area = false
				if Global.primeiro_dialogo_coitadinho == 2:
					$"Balao Sprite".hide()
					Dialogic.start("Coitadinho 3")
					player_is_on_area = false
	
func _on_body_entered(_body):
	$"Balao Sprite".show()
	player_is_on_area = true


func _on_body_exited(body: Node2D) -> void:
	$"Balao Sprite".hide()
	player_is_on_area = false
