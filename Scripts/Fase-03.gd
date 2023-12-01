extends Node2D

@onready var gos := $HUD/GameOverScreen
@onready var player := $panceta as CharacterBody2D
@onready var camera := $Camera2D as Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	player.follow_camera(camera)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !player:
		await get_tree().create_timer(1).timeout
		gos.visible = true



