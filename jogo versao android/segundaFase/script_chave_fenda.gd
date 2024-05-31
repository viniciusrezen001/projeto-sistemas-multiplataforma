extends Area2D


func _ready():
	pass

func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "jedi"):
		FaseDoisGlobal.chave_fenda = 1
		$CollisionShape2D.set_deferred("disabled", true);
		get_parent().queue_free()
