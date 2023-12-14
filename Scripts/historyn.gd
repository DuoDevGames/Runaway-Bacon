extends Node2D

@onready var transition = $transition
@export var next_level : String = ""
@onready var history_node = $"history-node"
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	history_node.text(label.text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Text"):
		transition.change_scene(next_level)
