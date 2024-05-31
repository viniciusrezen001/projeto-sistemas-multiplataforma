extends Node2D
var tempo = 30

func _ready():
	AudioTocando.parar_audio()

func _process(delta):
	if (tempo == 25):
		$Proximo.show()
	if (tempo == 0):
		get_tree().change_scene("res://primeiraFase/segunda_cutscene.tscn")
	
func _on_Proximo_pressed() -> void:
	get_tree().change_scene("res://primeiraFase/segunda_cutscene.tscn")

func _on_Timer_timeout():
	tempo -= 1



