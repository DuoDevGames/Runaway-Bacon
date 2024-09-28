extends Area2D

var player_is_on_area = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Balao Sprite".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(player_is_on_area == true):
		if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
			Dialogic.start("Ninmu Infos")
			player_is_on_area = false

func _on_body_entered(body: Node2D) -> void:
	$"Balao Sprite".show()
	player_is_on_area = true


func _on_body_exited(body: Node2D) -> void:
	$"Balao Sprite".hide()
	player_is_on_area = false
