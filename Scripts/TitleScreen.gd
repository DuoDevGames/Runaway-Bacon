extends Control





func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://cenas/Fase-01.tscn")


func _on_credits_btn_pressed():
	get_tree().change_scene_to_file("res://cenas/Ending.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()
