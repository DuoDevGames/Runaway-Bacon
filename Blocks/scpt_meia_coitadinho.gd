extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.missao_coitadinho_comecou == true):
		$".".visible = true
	

func _on_body_entered(_body):
	Global.primeiro_dialogo_coitadinho = 1
	Global.meia = 1
	print("Meia coletada")
	queue_free()
