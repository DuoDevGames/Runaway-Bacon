extends Control

@onready var num_coracao = $"MarginContainer/coracao-container/Label3" as Label
@onready var tempo = $MarginContainer/timer/Label2 as Label
@onready var player := $"../../Lombinho" as CharacterBody2D
var alive := true
var total_palhas = "teste " + str("%02d" % Global.palhas) + " / 10" 

# Called when the node enters the scene tree for the first time.
func _ready():
	num_coracao.text = str("%02d" % Global.coracoes)
	reset_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	num_coracao.text = str("%02d" % Global.coracoes)

var minutes = 0
var seconds = 0
var Dminutes = 1
var Dseconds = 59

func _on_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	if seconds > 0:
		seconds -= 1
	
	if minutes == 0:
		if seconds == 0:
			if alive:
				alive = false
				player.die()
	
	tempo.text = str(minutes) + ":" + str(seconds)

func reset_timer():
	seconds = Dseconds
	minutes = Dminutes
