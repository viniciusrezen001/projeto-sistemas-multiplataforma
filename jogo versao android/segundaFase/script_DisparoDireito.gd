extends Area2D

func _ready():
	pass 
	
var velocidade = 28

func _process(delta):
	global_position.x += velocidade
	
func _on_DisparoDireito_body_entered(body):
	if (body.name == "jedi" and Input.is_action_pressed("bater")):
		get_parent().queue_free()
		global.tiro_reverso = true
	if (body.name == "jedi" and Input.is_action_pressed("BaterPulando")):
		get_parent().queue_free()
		global.tiro_reverso = true
	elif (body.name == "jedi"):
		FaseDoisGlobal.vida_jedi -= 1
