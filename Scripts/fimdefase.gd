extends Area2D

@onready var transition = get_parent().get_node("transition")
@export var next_level : String = ""

func _on_body_entered(body):
	if body.name == "Lombinho":
		if Global.palhas < 10:
			start_dialog("faltapalha")
		elif Global.palhas >=10:
			if !next_level == "":
				transition.change_scene(next_level)
			else:
				print("No Scene Loaded")
	elif !next_level == "":
		transition.change_scene(next_level)
	else:
		print("No Scene Loaded")

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
