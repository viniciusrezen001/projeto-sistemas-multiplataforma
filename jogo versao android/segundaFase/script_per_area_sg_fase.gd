extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
	


func _on_Area2D_body_entered(body):
	
	if (body.name == "tiroInimigo" and Input.is_action_pressed("bater")):
		
		var cena_disparo = preload("res://primeiraFase/cena_disparo_personagem.tscn")
		var objeto_disparo = cena_disparo.instance()
		
		get_parent().add_child(objeto_disparo)
		objeto_disparo.global_position = $Position2D.global_position
