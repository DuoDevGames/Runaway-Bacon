extends Node2D

@onready var transition = $transition
@export var next_level : String = ""
@onready var history_node = $"history-node"
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.historyn == 0:
		hist_1()
	if Global.historyn == 1:
		Dialogic.start("His1_2")
		Dialogic.timeline_ended.connect(dialogic_end)
	if Global.historyn == 2:
		Dialogic.start("His1_3")
		Dialogic.timeline_ended.connect(dialogic_end)
	if Global.historyn == 3:
		Dialogic.start("His2_1")
		Dialogic.timeline_ended.connect(dialogic_end)
	if Global.historyn == 4:
		Dialogic.start("His2_2")
		Dialogic.timeline_ended.connect(dialogic_end)
	if Global.historyn == 5:
		Dialogic.start("His3_1")
		Dialogic.timeline_ended.connect(dialogic_end)
	if Global.historyn == 6:
		Dialogic.start("END")
		Dialogic.timeline_ended.connect(dialogic_end)


func dialogic_end():
	if Global.historyn == 0:
		Global.historyn = 1
	elif Global.historyn == 1:
		Global.historyn = 2
	elif Global.historyn == 2:
		Global.historyn = 3
	elif Global.historyn == 3:
		Global.historyn = 4
	elif Global.historyn == 4:
		Global.historyn = 5
	elif Global.historyn == 5:
		Global.historyn = 6
	transition.change_scene(next_level)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Skip"):
		transition.change_scene(next_level)

func hist_1():
	Dialogic.start("His0")
	Dialogic.timeline_ended.connect(hist_2)
	#Dialogic.timeline_ended.connect(dialogic_end)

func hist_2():
	$AnimationPlayer.play("camera 1")
	Dialogic.start("His0_1")
	Dialogic.timeline_ended.connect(hist_3)
	
func hist_3():
	$AnimationPlayer.play("camera 2")
	Dialogic.start("His0_1")
	Dialogic.timeline_ended.connect(dialogic_end)
	
