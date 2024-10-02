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
					start_dialog("Gato 1")
					player_is_on_area = false
					Global.missao_gato_comecou = true
				else:
					$"Balao Sprite".hide()
					if(Global.flores_arco_iris == 1):
						start_dialog("Gato 2")
						player_is_on_area = false
					elif(Global.flores_arco_iris == 0):
						start_dialog("Gato 5")
						player_is_on_area = false
					elif(Global.flores_arco_iris == 2):
						start_dialog("Gato 3")
						player_is_on_area = false
					elif(Global.flores_arco_iris == 3):
						Dialogic.timeline_ended.connect(receber_palhas)
						start_dialog("Gato 4")
						Dialogic.timeline_ended.disconnect(receber_palhas)
						player_is_on_area = false
						Global.missao_gato_completa = true
				
	
func _on_body_entered(_body):
	$"Balao Sprite".show()
	player_is_on_area = true


func _on_body_exited(body: Node2D) -> void:
	$"Balao Sprite".hide()
	player_is_on_area = false

func start_dialog(dialogname):
	pause_move()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start(dialogname)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	pause_move()

func pause_move():
	if Global.player_lock:
		Global.player_lock = false
	else:
		Global.player_lock = true

func receber_palhas():
	Global.palhas += 3
