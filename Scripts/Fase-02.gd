extends Node2D

@onready var gos := $HUD/GameOverScreen
@onready var player := $Lombinho as CharacterBody2D
@onready var lobo := $Lobo as CharacterBody2D
@onready var camera := $Camera2D as Camera2D
@onready var fundofazenda = $fundofazenda
@onready var fundofloresta = $fundofloresta


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.vel_corrida = 2
	lobo.follow_camera(camera)
	#fundofloresta.visible = false
	$Parallax2D/ParallaxLayer/Chuva.emitting = true 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !player:
		await get_tree().create_timer(1).timeout
		gos.visible = true

#func _on_area_2d_body_entered(body):
#	if body.name == player.name:
#		fundofloresta.visible = true
#d		fundofazenda.visible = false
