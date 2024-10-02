extends Area2D

var trava_planta = 0
var botao 
var plantio = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#condição inicial
	$AnimatedSprite2D.frame = 0
	show()
	trava_planta = 1
	Dados.semente_abobora -= 1
	botao = 0 
		
	#condição para crescimento
	if Dados.agua > 0 and Input.is_action_just_pressed("ui_accept") and Canteiro.trava_terra == 1:
		Dados.agua -= 1
		for i  in range(1,5):
			await get_tree().create_timer(3.0).timeout
			$AnimatedSprite2D.frame = i
		plantio = 1
	#condição para colheita
	if plantio == 1 and Input.is_action_just_pressed("ui_accept") and Canteiro.trava_terra == 1:
		$AnimatedSprite2D.frame = 5
		await get_tree().create_timer(1.0).timeout
		hide()
		Dados.abobora +=1
		trava_planta = 0
		plantio = 0
	pass
