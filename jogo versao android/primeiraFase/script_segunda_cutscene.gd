extends Node2D
var tempo = 5

func _ready():
	pass 
	
func _process(delta):
	if (tempo == 3):
		$Proximo.show()
	if (tempo == 0):
		get_tree().change_scene("res://primeiraFase/terceira_cutscene.tscn")

func _on_Proximo_pressed() -> void:
	get_tree().change_scene("res://primeiraFase/terceira_cutscene.tscn")


func _on_Timer_timeout():
	tempo -= 1 
