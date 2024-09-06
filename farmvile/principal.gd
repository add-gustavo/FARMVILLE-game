extends Node2D

var canteiro = preload("res://canteiro.tscn")
var tomate = preload("res://tomate.tscn")
var canteiro_instance = null  # Variável para armazenar a instância do canteiro

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	# Criação do canteiro ao pressionar "w" 
	if Input.is_action_just_pressed("w"):
		# Instanciar o canteiro e posicioná-lo
		canteiro_instance = canteiro.instantiate()
		canteiro_instance.position = $Didi.position  # Posicionar o canteiro em relação ao jogador Didi
		add_child(canteiro_instance)
		
		# Adicione um pequeno atraso ou verifique se o canteiro foi adicionado corretamente
		#await(get_tree().create_timer(0.1), "timeout")  # Aguardar um breve momento para garantir que o canteiro foi adicionado

	# Criação do tomate dentro do canteiro ao pressionar o botão "space"
	if Input.is_action_just_pressed("space") and canteiro_instance != null:
		# Instanciar o tomate e posicioná-lo
		var tomate_instance = tomate.instantiate()
		tomate_instance.position = $Didi.position  # Posicionar o tomate em relação ao jogador Didi
		add_child(tomate_instance)





	#instance.position = get_global_mouse_position()
		
