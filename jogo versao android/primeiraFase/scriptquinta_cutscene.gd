extends Node2D
var tempo = 30

func _ready():
	pass 

func _process(delta):
	if (tempo == 27):
		$Proximo.show()
	if (tempo == 0):
		get_tree().change_scene("res://segundaFase/cena_funda_fasedois.tscn")
	
func _on_Proximo_pressed() -> void:
	get_tree().change_scene("res://segundaFase/cena_funda_fasedois.tscn")

func _on_Timer_timeout():
	tempo -= 1



