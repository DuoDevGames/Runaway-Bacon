extends CanvasLayer

@onready var resume_btn = $menu_holder/resume_btn

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		if !Global.player_lock:
			visible = true
			get_tree().paused = true
			resume_btn.grab_focus()

func _on_resume_btn_pressed():
	SoundsController.play_buttonpressed_sound()
	get_tree().paused = false
	visible = false 

func _on_quit_btn_pressed():
	SoundsController.play_buttonpressed_sound()
	get_tree().quit()

func _on_menu_btn_pressed():
	SoundsController.play_buttonpressed_sound()
	Global.reloadtitle = true
	get_tree().change_scene_to_file("res://cenas/title_screen.tscn")
