extends Node

var db = null

func _ready():
	# Inicializa a conexão com o banco de dados
	db = SQLiteWrapper.new()
	var path = "res://teste.db"  # Caminho para o banco de dados
	var error = db.open(path)
	if error != OK:
		print("Erro ao abrir o banco de dados")
		return
	
	# Cria a tabela se não existir
	var create_table_query = """
	CREATE TABLE IF NOT EXISTS ranking (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		nome TEXT NOT NULL,
		pontos INTEGER NOT NULL
	);
	"""
	db.query(create_table_query)
	print("Tabela de ranking criada ou já existente")
	
	# Adiciona novos jogadores e mostra o ranking
	adicionar_novo_jogador()
	mostrar_ranking()

func inserir_jogador(nome, pontos):
	var insert_query = "INSERT INTO ranking (nome, pontos) VALUES ('%s', %d);" % [nome, pontos]
	db.query(insert_query)
	print("Jogador inserido: %s com %d pontos" % [nome, pontos])

func obter_ranking():
	var select_query = "SELECT nome, pontos FROM ranking ORDER BY pontos DESC;"
	db.query(select_query)
	var ranking = []
	while db.step() == OK:
		var jogador = {
			"nome": db.get_column_text(0),
			"pontos": db.get_column_int(1)
		}
		ranking.append(jogador)
	return ranking

func adicionar_novo_jogador():
	inserir_jogador("Jogador1", 1500)
	inserir_jogador("Jogador2", 2500)
	inserir_jogador("Jogador3", 1000)

func mostrar_ranking():
	var ranking = obter_ranking()
	for jogador in ranking:
		print("Nome: %s - Pontos: %d" % [jogador["nome"], jogador["pontos"]])