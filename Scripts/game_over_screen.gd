extends Control

@onready var game_over_marco = $GameOverMarco

func _ready():
	MusicController.stop_fase1_music()
	#MusicController.play_gameover_music()
	
func _on_restart_button_pressed():
	Global.player_lock = false
	SoundsController.play_buttonpressed_sound()
	#MusicController.stop_gameover_music()
	get_tree().reload_current_scene()
