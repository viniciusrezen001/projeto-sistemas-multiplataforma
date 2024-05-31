extends Node2D

func _ready():
	pass 

func criar_inimigo():
	var cena_inimigo = preload("res://primeiraFase/cena_nave_inimiga.tscn")
	var objeto_inimigo = cena_inimigo.instance()
	
	add_child(objeto_inimigo)
	
	objeto_inimigo.global_position.x= get_viewport().size.x + 20
	randomize()
	objeto_inimigo.global_position.y = rand_range(0,get_viewport().size.y)
