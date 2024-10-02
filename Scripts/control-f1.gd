extends Control

@onready var num_palha = $"MarginContainer/palha-container/Label3" as Label
@onready var num_coracao = $"MarginContainer/coracao-container/Label3" as Label
@onready var num_meia = $"MarginContainer/missoes/meia-container/Label3" as Label
@onready var num_flores = $"MarginContainer/missoes/flor-container2/Label3" as Label

var alive := true
var total_palhas = "teste " + str("%02d" % Global.palhas) + " / 10" 

# Called when the node enters the scene tree for the first time.
func _ready():
	num_palha.text = total_palhas
	num_coracao.text = str("%02d" % Global.coracoes)
	num_meia.text = str("%02d" % Global.meia)
	num_flores.text = str("%02d" % Global.flores_arco_iris)
	$"MarginContainer/missoes/meia-container".visible = false
	$"MarginContainer/missoes/flor-container2".visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	num_palha.text = str("%02d" % Global.palhas)
	num_coracao.text = str("%02d" % Global.coracoes)
	num_meia.text = str("%02d" % Global.meia)
	num_flores.text = str("%02d" % Global.flores_arco_iris)
	if(Global.missao_coitadinho_comecou == true && Global.missao_coitadinho_completa == false):
		$"MarginContainer/missoes/meia-container".visible = true
	if(Global.missao_coitadinho_completa == true):
		$"MarginContainer/missoes/meia-container".visible = false
	if(Global.missao_gato_comecou == true && Global.missao_gato_completa == false):
		$"MarginContainer/missoes/flor-container2".visible = true
	if(Global.missao_gato_completa == true):
		$"MarginContainer/missoes/flor-container2".visible = false
	
	
