extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var transition = $"."

func _ready():
	var show_transition = get_tree().create_tween()
	show_transition.tween_property(color_rect, "threshold", 0.0, 0.7).from(1.0)
	await show_transition.finished
	transition.hide()
