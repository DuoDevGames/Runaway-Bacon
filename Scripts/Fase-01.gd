extends Node2D

@onready var gos := $HUD/GameOverScreen
@onready var player := $Lombinho as CharacterBody2D
@onready var camera := $Camera2D as Camera2D
@onready var teleporter_out = $"Teleporter-out"
@onready var parede: StaticBody2D = $Missao/parede


# Called when the node enters the scene tree for the first time.
func _ready():
	player.SPEED = 200
	player.follow_camera(camera)
	MusicController.stop_menu_music()
	MusicController.play_fase1_music()
	_reset_var()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !player:
		Global.player_lock = true
		await get_tree().create_timer(1).timeout
		gos.visible = true


func _on_teleporter_body_entered(body):
	body.position = teleporter_out.position


func _on_update_area_body_entered(body: Node2D) -> void:
	if Global.parede == false:
		parede.get_node("CollisionShape2D").set_deferred("disabled", true)

func _reset_var():
	Global.palhas = 0
	Global.palhas_total = 15
	Global.coracoes = 3
	Global.score = 0
	Global.vel_corrida = 1
	Global.player_lock = false

	#Missão do Coitadinho
	Global.meia = 0
	Global.primeiro_dialogo_coitadinho = 0
	Global.parede = true
	Global.missao_coitadinho_completa = false
	Global.missao_coitadinho_comecou = false

	#Missão do Gato
	Global.flores_arco_iris = 0
	Global.missao_gato_comecou = false
	Global.missao_gato_completa = false
