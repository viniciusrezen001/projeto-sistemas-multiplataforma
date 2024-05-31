extends KinematicBody2D

var vida = 100

func _ready():
	pass

var forca_gravidade = 1000
var mov := Vector2(0,0)
var velocidade = 0

func _process(delta):
	$ProgressBar.value = vida
	mov.y += forca_gravidade * delta
	mov.x = 0;
	mov = move_and_slide(mov,Vector2(0,-1))
	
	position = Vector2(position.x + velocidade, position.y)
	
func _on_sensorDireito_body_entered(body):
	if (body.name == "jedi"):
		$Sprite.flip_h = false
		velocidade = 2
	
func _on_sensorEsquerdo_body_entered(body):
	if (body.name == "jedi"):
		$Sprite.flip_h = true
		velocidade -= 2

func _clone_atira():
	if ($Sprite.flip_h == true):
		var cena_disparo = preload("res://primeiraFase/cena_inimigo_disparo.tscn")
		var objeto_disparo = cena_disparo.instance()
			
		get_parent().add_child(objeto_disparo)
			
		objeto_disparo.global_position = $Position2D.global_position
		
	else:
		var cena_disparo = preload("res://segundaFase/cena_disparo_inimigo_direita.tscn")
		var objeto_disparo = cena_disparo.instance()
			
		get_parent().add_child(objeto_disparo)
			
		objeto_disparo.global_position = $Position2D.global_position
		
func _on_Area2D_body_entered(body):
	if (body.name == "jedi" and Input.is_action_pressed("bater")):
		vida -= 20
		if (vida <= 0):
			get_parent().queue_free()
			
	elif (body.name == "jedi"):
		FaseDoisGlobal.vida_jedi -= 2
		
	if (body.name == "jedi" and Input.is_action_pressed("BaterPulando")):
		vida -= 40
		if (vida <= 0):
			get_parent().queue_free()
			
	if (body.name =="disparoPersonagem" or body.name == "TiroPlayerUm"):
		vida -= 20
