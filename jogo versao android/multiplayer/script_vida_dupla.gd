extends Area2D

var confirmar = 0

func _ready():
	pass

var velocidade = 6

func _process(delta):
	global_position.x -= velocidade

func _on_vida_dupla_body_entered(body):
	if (body.name =="Playerum" or body.name == "Playerdois"):
		velocidade = 0
		$CollisionShape2D.set_deferred("disabled", true);
		global.vida_dupla += 1
		confirmar += 1
		get_parent().queue_free()


#func _on_Area2D_area_entered(area):
#	if (confirmar):
#		area.queue_free()

