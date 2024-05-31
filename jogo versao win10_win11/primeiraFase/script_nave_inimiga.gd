extends Area2D
func _ready():
	pass 
	
var velocidade = 7

func _process(delta):
	
	global_position.x -= velocidade
	
func _on_Area2D_area_entered(area):
	if (area.name == "disparoPersonagem" or area.name == "TiroPlayerUm"):
		$CollisionShape2D.set_deferred("disabled", true);
		velocidade = 0
		$AnimationPlayer.play("explodindo")
		area.queue_free()
		
func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name == "explodindo"):
		global.qtd_pontos += 1
		get_parent().queue_free()

func _on_Area2D_body_entered(body):
	if (body.name == "Personagem"):
		global.qtd_vidas -= 1
		velocidade = 0
		$AnimationPlayer.play("explodindo")
		$CollisionShape2D.set_deferred("disabled", true);
		if (global.qtd_vidas == 0):
			get_tree().change_scene("res://primeiraFase/quinta_cutscene.tscn")
			
	elif (body.name == "Playerum"):
		global.vida_playerum -= 1
		velocidade = 0 
		$AnimationPlayer.play("explodindo")
		$CollisionShape2D.set_deferred("disabled", true);
	
	elif (body.name == "Playerdois"):
		global.vida_playerum -= 1
		velocidade = 0 
		$AnimationPlayer.play("explodindo")
		$CollisionShape2D.set_deferred("disabled", true);
		
func inimigo_atira():
	var cena_disparo = preload("res://primeiraFase/cena_inimigo_disparo.tscn")
	var objeto_disparo = cena_disparo.instance()
		
	get_parent().add_child(objeto_disparo)
		
	objeto_disparo.global_position = $Position2D.global_position
