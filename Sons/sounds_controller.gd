extends Node


# Called when the node enters the scene tree for the first time.
func play_jump_sound():
	$jump.play()

func play_palha_sound():
	$palha.play()

func play_hover_sound():
	$hover.play()

func play_buttonpressed_sound():
	$"button pressed".play()
	
	
func play_hitraposa_sound():
	$"hit raposa".play()
