extends Node2D

@onready var gos := $HUD/GameOverScreen
@onready var player := $Lombinho as CharacterBody2D
@onready var camera := $Camera2D as Camera2D
@onready var teleporter_out = $"Teleporter-out"




# Called when the node enters the scene tree for the first time.
func _ready():
	player.follow_camera(camera)
	MusicController.stop_menu_music()
	MusicController.play_fase1_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !player:
		await get_tree().create_timer(1).timeout
		gos.visible = true


func _on_teleporter_body_entered(body):
	body.position = teleporter_out.position
