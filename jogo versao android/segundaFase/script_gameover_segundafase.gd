extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		get_tree().change_scene("res://segundaFase/cena_funda_fasedois.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://segundaFase/cena_funda_fasedois.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://tela inicial/cena_menu_jogo.tscn")
