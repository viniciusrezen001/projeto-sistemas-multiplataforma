extends KinematicBody2D

func _ready():
	$Sprite.flip_h = true
	pass # Replace with function body.

var mov = Vector2.ZERO
var velocidade = 320

func _process(delta):
	var altura = get_viewport_rect().size.y
	var largura = get_viewport_rect().size.x
	
	mov = Vector2.ZERO
	if(Input.is_action_pressed("ptras") and global_position.x > 70):
		mov.x = -velocidade
	elif(Input.is_action_pressed("pfrente") and global_position.x < largura -70):
		mov.x = velocidade
		
	if(Input.is_action_pressed("pcima") and global_position.y > 30):
		mov.y = -velocidade
	elif(Input.is_action_pressed("pbaixo") and global_position.y < altura -30):
		mov.y = velocidade
	
	if(Input.is_action_just_pressed("disparar")):
	
		var cena_disparo = preload("res://primeiraFase/cena_disparo_personagem.tscn")
		var objeto_disparo = cena_disparo.instance()
		
		get_parent().add_child(objeto_disparo)
		
		objeto_disparo.global_position = $Position2D.global_position
		
	move_and_slide(mov)


func _on_Button_pressed():
	if(global_position.y > 30):
		mov.y = -velocidade
	move_and_slide(mov)
