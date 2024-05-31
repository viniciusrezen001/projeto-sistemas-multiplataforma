extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for button in get_tree().get_nodes_in_group("button"):
		button.connect("pressed", self, "on_button_pressed", [button])
		button.connect("mouse_exited", self, "mouse_interaction", [button, "exited"])
		button.connect("mouse_entered", self, "mouse_interaction", [button, "entered"])

func on_button_pressed(button: Button) -> void:
	match button.name:
		"Play_game":
			var _game: bool = get_tree().change_scene("res://primeiraFase/primeira_cutscene.tscn")
			
		"Multip":
			var _multi: bool = get_tree().change_scene("res://multiplayer/cena_fase_multiplayer.tscn")
			
		"Controls":
			var _controls: bool = get_tree().change_scene("res://tela inicial/cena_controleso.tscn")
			
		"ranked":
			var _controls: bool = get_tree().change_scene("res://ranqueada/cena_fase_ranqueada.tscn")




	
