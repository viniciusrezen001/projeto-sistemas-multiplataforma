extends ParallaxBackground


func _ready():
	global.resetar_variaveis()
	pass

var velocidade = 6

func _process(delta):
	$VidaPlayerUm.value = global.vida_playerum
	scroll_base_offset.x -= velocidade
	
	$Tempo.text = str(global.tempo)
	$Abates.text = "Abates: " + str(global.qtd_pontos)
	$VidaDupla.text = "Vida: " + str(global.vida_dupla)

func _on_contador_timeout():
	global.tempo += 1
