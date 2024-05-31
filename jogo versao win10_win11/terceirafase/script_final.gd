extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (tempo == 5):
		get_tree().change_scene("res://tela inicial/cena_menu_jogo.tscn")


func _on_Timer_timeout():
	tempo += 1
