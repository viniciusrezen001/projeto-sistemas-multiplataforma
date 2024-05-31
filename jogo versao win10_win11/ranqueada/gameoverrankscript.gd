extends Node2D

func _ready():
	global.resetar_variaveis()
	pass # Replace with function body.

func _process(delta):
	if(Input.is_action_pressed("ui_accept")):
		get_tree().change_scene("res://ranqueada/cena_fase_ranqueada.tscn")
	elif(Input.is_action_pressed("p2baixo")):
		get_tree().change_scene("res://tela inicial/cena_menu_jogo.tscn")
	
