extends Node2D

@onready var transition = $transition
@export var next_level : String = ""
@onready var history_node = $"history-node"
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.historyn == 1:
		Dialogic.start("His1_2")
		Dialogic.timeline_ended.connect(dialogic_end)
	if Global.historyn == 2:
		Dialogic.start("His1_3")
		Dialogic.timeline_ended.connect(dialogic_end)
	if Global.historyn == 3:
		Dialogic.start("His2_1")
		Dialogic.timeline_ended.connect(dialogic_end)


func dialogic_end():
	if Global.historyn == 1:
		Global.historyn = 2
	elif Global.historyn == 2:
		Global.historyn = 3
	elif Global.historyn == 3:
		Global.historyn = 4
	transition.change_scene(next_level)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Skip"):
		transition.change_scene(next_level)
