extends Node2D

func _on_button_pressed():
	SoundsController.play_buttonpressed_sound()
	get_tree().change_scene_to_file("res://cenas/title_screen.tscn")
