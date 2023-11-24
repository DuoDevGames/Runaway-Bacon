extends Control

@onready var num_palha = $"MarginContainer/palha-container/Label3" as Label
@onready var num_coracao = $"MarginContainer/coracao-container/Label3" as Label
var player = null
var total_palhas = "teste " + str("%02d" % Global.palhas) + " / 10" 

# Called when the node enters the scene tree for the first time.
func _ready():
	num_palha.text = total_palhas
	num_coracao.text = str("%02d" % Global.coracoes)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	num_palha.text = str("%02d" % Global.palhas)
	num_coracao.text = str("%02d" % Global.coracoes)


