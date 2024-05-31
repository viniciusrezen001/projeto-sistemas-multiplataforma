extends ParallaxBackground


func _ready():
	global.resetar_variaveis()

var velocidade = 3

func _process(delta):
	$ProgressBar.value = global.qtd_vidas
	scroll_base_offset.x -= velocidade
	
	#$Tempo.text = str(global.tempo)
	$Abates.text = "Abates:" + str(global.qtd_pontos)

func _on_Timer_timeout():
	global.tempo += 1
