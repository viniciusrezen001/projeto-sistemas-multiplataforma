extends KinematicBody2D

func _ready():
	pass # Replace with function body.

var mov = Vector2.ZERO
var velocidade = 1000

func _process(delta):
	var altura = get_viewport_rect().size.y
	var largura = get_viewport_rect().size.x
	
	mov = Vector2.ZERO
	if(Input.is_action_pressed("ptras") and global_position.x > 70):
		mov.x = -velocidade
		$Sprite.flip_h = false
	elif(Input.is_action_pressed("pfrente")):
		mov.x = velocidade
		$Sprite.flip_h = true
	if(Input.is_action_pressed("pcima") and global_position.y > 30):
		mov.y = -velocidade
	elif(Input.is_action_pressed("pbaixo") and global_position.y < altura -30):
		mov.y = velocidade
		
	move_and_slide(mov)
