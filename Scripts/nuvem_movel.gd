extends Node2D

const wait_duration := 1.0
var cloud_pos = 0
var physics_proc := false

@onready var plataform := $nuvem as AnimatableBody2D
@export var move_speed := 3.0
@export var  distance := 130*2

var follow := Vector2.ZERO
var plataform_center := 16

func _ready() -> void:
	move_platform()
	

func _physics_process(delta: float) -> void:
	#if(physics_proc == true):
	plataform.position = plataform.position.lerp(follow, 0.5)
	

func move_platform():
	var move_direction = Vector2.UP * distance
	var duration = move_direction.length()/float(move_speed *plataform_center)
	var platform_tween = create_tween().set_loops()
	platform_tween.tween_property(self, 'follow', move_direction, duration).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)#.set_delay(wait_duration)
	platform_tween.tween_property(self, 'follow', Vector2.ZERO, duration).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT).set_delay(wait_duration)


#func _on_area_2d_body_entered(body: Node2D) -> void:
#	physics_proc = true
