extends Node2D

var tempo_cutscene3 = 5
func _ready():
	pass 
	
func _process(_delta):
	$Tempo.text = str(tempo_cutscene3)
	if (tempo_cutscene3 == 0):
		get_tree().change_scene("res://primeiraFase/cena_primeira_fase.tscn")


func _on_Timer_timeout():
	tempo_cutscene3 -= 1
