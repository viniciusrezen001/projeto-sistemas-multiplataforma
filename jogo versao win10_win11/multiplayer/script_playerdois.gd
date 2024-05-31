extends KinematicBody2D

func _ready():
	$Sprite.flip_h = true
	pass

var mov = Vector2.ZERO
var velocidade = 320

func _process(delta):
	var altura = get_viewport_rect().size.y
	var largura = get_viewport_rect().size.x
	
	mov = Vector2.ZERO
	if(Input.is_action_pressed("p2tras") and global_position.x > 70):
		mov.x = -velocidade
	elif(Input.is_action_pressed("p2frente") and global_position.x < largura -70):
		mov.x = velocidade
		
	if(Input.is_action_pressed("p2cima") and global_position.y > 30):
		mov.y = -velocidade
	elif(Input.is_action_pressed("p2baixo") and global_position.y < altura -30):
		mov.y = velocidade
	
	if(Input.is_action_just_pressed("p2disparar")):
	
		var cena_disparo = preload("res://primeiraFase/cena_disparo_personagem.tscn")
		var objeto_disparo = cena_disparo.instance()
		
		get_parent().add_child(objeto_disparo)
		
		objeto_disparo.global_position = $Position2D.global_position
		
	move_and_slide(mov)
