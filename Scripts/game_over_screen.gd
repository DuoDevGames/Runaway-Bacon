extends Control

@onready var game_over_marco = $GameOverMarco

func _on_restart_button_pressed():
	get_tree().reload_current_scene()
