
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
var direction = Vector2(0, 1)  # Direção inicial: para cima
var speed = 10  # Velocidade do movimento
var amplitude = 5  # Amplitude do movimento

func _process(delta):	
	# Movimento vertical
	var movement = direction * speed * delta
	translate(movement)

	# Verifica se atingiu a amplitude superior ou inferior
	if position.y > amplitude or position.y < -amplitude:
		# Inverte a direção ao atingir a amplitude
		direction = -direction


