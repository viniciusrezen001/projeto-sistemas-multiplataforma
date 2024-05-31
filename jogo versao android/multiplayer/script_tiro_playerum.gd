extends Area2D

func _ready():
	pass 
	
var velocidade = 28

func _process(delta):
	global_position.x -= velocidade
	
