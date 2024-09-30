extends Control

var isMusicPlaying : bool = false

func _ready():
	MusicController.play_menu_music()
	
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
