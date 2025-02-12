extends Node2D

@onready var transition = $transition
@export var next_level : String = ""
@onready var history_node = $"history-node"
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.historyn == 0:
		hist_count()
	if Global.historyn == 1:
		hist_count2()
	if Global.historyn == 2:
		Dialogic.timeline_ended.connect(dialogic_end)
		Dialogic.start("His1_3")
	if Global.historyn == 3:
		Dialogic.timeline_ended.connect(dialogic_end)
		Dialogic.start("His2_1")
	if Global.historyn == 4:
		Dialogic.timeline_ended.connect(dialogic_end)
		Dialogic.start("His2_2")
	if Global.historyn == 5:
		Dialogic.timeline_ended.connect(dialogic_end)
		Dialogic.start("His3_1")
	if Global.historyn == 6:
		Dialogic.timeline_ended.connect(dialogic_end)
		Dialogic.start("END")


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
	Dialogic.timeline_ended.disconnect(dialogic_end)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Skip"):
		transition.change_scene(next_level)

func hist_count():
	Dialogic.timeline_ended.connect(hist_count)
	if(Global.his0_time == 0):
		Dialogic.start("His0")
		Global.his0_time = 1
	elif(Global.his0_time == 1):
		$AnimationPlayer.play("camera 1")
		Dialogic.start("His0_1")
		Global.his0_time = 2
	elif(Global.his0_time == 2):
		Dialogic.start("His0_2")
		$AnimationPlayer.play("camera 2")
		Global.his0_time = 3
	elif(Global.his0_time == 3):
		Dialogic.start("His0_3")
		$AnimationPlayer.play("camera 3")
		Global.his0_time = 4
	elif(Global.his0_time == 4):
		Dialogic.start("His0_4")
		$AnimationPlayer.play("camera 4")
		Global.his0_time = 5
	elif(Global.his0_time == 5):
		Dialogic.timeline_ended.connect(dialogic_end)
		Dialogic.start("His0_5")
		$AnimationPlayer.play("camera 5")
		Global.his0_time = 6
		Dialogic.timeline_ended.disconnect(hist_count)

func hist_count2():
	if(Global.hist1_time == 0):
		$AnimationPlayer.play("corrida_marco")
		Global.hist1_time = 1
		hist_count2()
	elif(Global.hist1_time == 1):
		Dialogic.start("His1_2")
		Dialogic.timeline_ended.connect(dialogic_end)
		
		
#func hist_fim():
#	Global.his0_time = 6
#	Dialogic.end_timeline("His0_5")
#	dialogic_end()
	

func _on_timeline_ended():
	Global.his0_time = 6
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	dialogic_end()

	#Dialogic.timeline_ended.connect(dialogic_end)
	
