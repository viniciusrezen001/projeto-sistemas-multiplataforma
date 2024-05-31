extends Node2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	
	if (global.vida_playerum == 0):
		global.resetar_vida_player_um()
		global.vida_dupla -= 1
		if (global.vida_dupla == 0):
			get_tree().change_scene("res://multiplayer/cena_game_over.tscn")
			
	if (global.vida_playerdois == 0):
		global.resetar_vida_player_dois()
		global.vida_dupla -= 1
		if (global.vida_dupla == 0):
			get_tree().change_scene("res://multiplayer/cena_game_over.tscn")

func _on_inimigo_aparece_timeout():
	var cena_inimigo = preload("res://primeiraFase/cena_nave_inimiga.tscn")
	var objeto_inimigo = cena_inimigo.instance()
	
	add_child(objeto_inimigo)
	
	objeto_inimigo.global_position.x= get_viewport().size.x + 20
	randomize()
	objeto_inimigo.global_position.y = rand_range(0,get_viewport().size.y)
	print($Timer.wait_time)
	if ($Timer.wait_time <= 3.0 and $Timer.wait_time >= 0.5):
		$Timer.wait_time -= 0.05
		
func _on_aparecer_vida_equipe_timeout():
	var cena_inimigo = preload("res://multiplayer/cena_vida_dupla.tscn")
	var objeto_vida = cena_inimigo.instance()
	
	add_child(objeto_vida)
	
	objeto_vida.global_position.x= get_viewport().size.x + 20
	randomize()
	objeto_vida.global_position.y = rand_range(0,get_viewport().size.y)
	
	if ($Timer2.wait_time):
		$Timer2.wait_time += 5.0
		print($Timer2.wait_time)
