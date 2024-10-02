extends Control

var isMusicPlaying : bool = false


func _ready():
	MusicController.play_menu_music()
	if get_tree().paused:
		get_tree().paused = false
	_reset_var()


func _on_start_btn_pressed():
	MusicController.stop_menu_music()
	SoundsController.play_buttonpressed_sound()
	get_tree().change_scene_to_file("res://cenas/history_0.tscn")


func _on_credits_btn_pressed():
	SoundsController.play_buttonpressed_sound()
	get_tree().change_scene_to_file("res://cenas/Ending.tscn")


func _on_quit_btn_pressed():
	SoundsController.play_buttonpressed_sound()
	get_tree().quit()

func _reset_var():
	Global.palhas = 0
	Global.palhas_total = 15
	Global.coracoes = 3
	Global.score = 0
	Global.historyn = 0
	Global.vel_corrida = 1
	Global.player_lock = false

	#Missão do Coitadinho
	Global.meia = 0
	Global.primeiro_dialogo_coitadinho = 0
	Global.parede = true
	Global.missao_coitadinho_completa = false
	Global.missao_coitadinho_comecou = false

	#Missão do Gato
	Global.flores_arco_iris = 0
	Global.missao_gato_comecou = false
	Global.missao_gato_completa = false
