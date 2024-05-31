extends KinematicBody2D

var velocidade = 20000
var forca_pulo = 50000
var forca_gravidade = 1500
var mov := Vector2(0,0)

func _ready():
	pass

func _process(delta):    
	$ProgressBar.value = FaseDoisGlobal.vida_jedi    
	mov.y += forca_gravidade * delta
	mov.x = 0;    
	$Chances.text = "Chances:" + str(FaseDoisGlobal.chances)
	$Martelo.text = str(FaseDoisGlobal.martelo) + "/1"
	$Fixa.text = str(FaseDoisGlobal.chave_fixa) + "/1"
	$Fenda.text = str(FaseDoisGlobal.chave_fenda) + "/1"
	
	if (FaseDoisGlobal.chances == 0):
		FaseDoisGlobal.resetar_vida()
		FaseDoisGlobal.resetar_chance()
		get_tree().change_scene("res://segundaFase/cena_gameover_segundafase.tscn")
	
	if (FaseDoisGlobal.vida_jedi == 0):
		FaseDoisGlobal.chances -= 1
		FaseDoisGlobal.resetar_vida()
		get_tree().change_scene("res://segundaFase/cena_funda_fasedois.tscn")
		
	if (Input.is_action_pressed("ui_left")):
		mov.x -= velocidade * delta        
		#$AnimationPlayer.acale.x = true 
		$Sprite.flip_h = true   
		
				
	elif (Input.is_action_pressed("ui_right")):
		mov.x += velocidade * delta
		#$AnimationPlayer.flip_h = false 
		$Sprite.flip_h = false 
	
		
	if (Input.is_action_just_pressed("ui_up") and is_on_floor()):
		mov.y -= forca_pulo * delta    
		
	if (global.tiro_reverso and $Sprite.flip_h == false):
		
		var cena_disparo = preload("res://primeiraFase/cena_disparo_personagem.tscn")
		var objeto_disparo = cena_disparo.instance()
		
		get_parent().add_child(objeto_disparo)
		
		objeto_disparo.global_position = $Position2D.global_position
		global.resetar_tiro()
		
	elif (global.tiro_reverso and $Sprite.flip_h == true):
		
		var cena_disparo = preload("res://multiplayer/cena_tiro_playerum.tscn")
		var objeto_disparo = cena_disparo.instance()
		
		get_parent().add_child(objeto_disparo)
		
		objeto_disparo.global_position = $Position2D.global_position
		global.resetar_tiro()
		print("foi")
		
	if (is_on_floor()):
		
		
		if (Input.is_action_pressed("bater")):
			$AnimationPlayer.play("ataque")
			
		elif (mov.x==0):
			$AnimationPlayer.play("parado") 
		else:
			$AnimationPlayer.play("carrendo")  
			
	elif (Input.is_action_pressed("BaterPulando")):
		$AnimationPlayer.play("ataque_pulo")
	
	elif(Input.is_action_pressed("bater")):
		$AnimationPlayer.play("ataque")
		
	else:
		$AnimationPlayer.play("pulando")  
		
	mov = move_and_slide(mov,Vector2(0,-1))
	
	

