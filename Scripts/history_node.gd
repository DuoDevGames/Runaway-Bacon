extends CanvasLayer

@export var history : String = ""
@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.stop_fase1_music()
	MusicController.stop_gameover_music()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func text(htext = ""):
	label.text = htext
