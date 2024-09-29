extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.missao_gato_comecou == true):
		$".".visible = true


func _on_body_entered(body: Node2D) -> void:
	Global.flores_arco_iris += 1
	print(Global.flores_arco_iris)
	$".".queue_free()


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
