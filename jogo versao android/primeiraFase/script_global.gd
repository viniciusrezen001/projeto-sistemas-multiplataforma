extends Node

var qtd_vidas = 5
var qtd_pontos = 0
var valor_pontos_inimigo = 1
var tempo = 0
var tempo_cutscene3 = 5
var vida_dupla = 2
var vida_playerum = 5
var vida_playerdois = 5
var velocidade = 28
var tiro_reverso = false

func resetar_variaveis():
	qtd_vidas = 5
	qtd_pontos = 0
	tempo = 0
	tempo_cutscene3 = 5
	vida_dupla = 2
	vida_playerum = 5
	vida_playerdois = 5

func resetar_vida_player_um():
	vida_playerum = 5
	
func resetar_vida_player_dois():
	vida_playerdois = 5
	
func resetar_tiro():
	tiro_reverso = false
	
