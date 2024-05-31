extends Area2D
var velo = 0
func _ready():
	pass 
var velocidade = 28
var tiro_reverso = false
func _process(delta):
	global_position.x -= velocidade

	
func _on_Area2D_body_entered(body):
	
	if (body.name == "Personagem"):
		global.qtd_vidas -= 1
		if (global.qtd_vidas == 0):
			get_tree().change_scene("res://primeiraFase/quinta_cutscene.tscn")
			
	if (body.name == "Playerum"):
		global.vida_playerum -= 1
		
	elif (body.name == "Playerdois"):
		global.vida_playerdois -= 1
		
	if (body.name == "jedi" and Input.is_action_pressed("bater")):
		get_parent().queue_free()
		global.tiro_reverso = true
	elif (body.name == "jedi" and Input.is_action_pressed("BaterPulando")):
		get_parent().queue_free()
		global.tiro_reverso = true
	elif (body.name == "jedi"):
		FaseDoisGlobal.vida_jedi -= 1

	
