extends Control

@onready var num_coracao = $"MarginContainer/coracao-container/Label3" as Label
@onready var tempo = $MarginContainer/timer/Label2 as Label
var alive := true
var total_palhas = "teste " + str("%02d" % Global.palhas) + " / 10" 

# Called when the node enters the scene tree for the first time.
func _ready():
	num_coracao.text = str("%02d" % Global.coracoes)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	num_coracao.text = str("%02d" % Global.coracoes)
