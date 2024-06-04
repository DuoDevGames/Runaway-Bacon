extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_menu_music():
	$menu_bg_music.play()


func stop_menu_music():
	$menu_bg_music.stop()
	
func play_fase1_music():
	$fase1_bg_music.play()
