extends Area2D

var player_is_on_area = false

func _ready():
	$"Balao Sprite".hide()
	
func _process(_delta):
	if(player_is_on_area == true):
		if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
			if(Global.missao_gato_completa == false):
				if Global.missao_gato_comecou == false:
					$"Balao Sprite".hide()
					Dialogic.start("Gato 1")
					player_is_on_area = false
					Global.missao_gato_comecou = true
				else:
					$"Balao Sprite".hide()
					if(Global.flores_arco_iris < 3 && Global.flores_arco_iris > 1):
						Dialogic.start("Gato 2")
						player_is_on_area = false
					if(Global.flores_arco_iris == 0):
						Dialogic.start("Coitadinho 3")
						player_is_on_area = false
					if(Global.flores_arco_iris == 3):
						Dialogic.start("Coitadinho 4")
						player_is_on_area = false
						#ADICIONAR MAIS CÓDIGO AQUI!!!!!!!!!!!!!!!1
						Global.missao_gato_completa = true
				
	
func _on_body_entered(_body):
	$"Balao Sprite".show()
	player_is_on_area = true


func _on_body_exited(body: Node2D) -> void:
	$"Balao Sprite".hide()
	player_is_on_area = false
