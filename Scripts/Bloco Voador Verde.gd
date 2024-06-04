extends  Node2D

const WAIT_DURATION := 1.0

@onready var cloud := $"Bloco Voador Verde"  as AnimatableBody2D
@export var move_speed := 3
@export var distance := 100
@export var move_horizontal := true

var follow := Vector2.ZERO
var cloud_center := 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_cloud()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	cloud.position = cloud.position.lerp(follow, 0.5)


func move_cloud():
	var move_direction = Vector2.DOWN* distance if move_horizontal else Vector2.UP * distance
	var duration = move_direction.length() / float(move_speed * cloud_center)
	var cloud_tween = create_tween().set_loops()
	cloud_tween.tween_property(self, "follow", move_direction, duration)
	cloud_tween.tween_property(self, "follow", Vector2.ZERO, duration)
