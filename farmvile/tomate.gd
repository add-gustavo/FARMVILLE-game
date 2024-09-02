extends Area2D
#trava para estar no local
var trava_terra = 0
#trava para apertar o botao
var botao = 0
#trava para caso já houver uma planta no local
var trava_planta = 0
#trava para caso já estiver pronta para colheita
var leguminosa = 0
func _ready() -> void:
	hide()
	
func _process(delta: float) -> void:
	#cabeçalho
	$"../semente/semente_tomate".text = str("sementes-tomate: ",Dados.semente,"\n","agua: ", Dados.agua, "\n", "Tomate: ", Dados.tomate)
	#trava de plantação
	if Input.is_action_just_pressed("ui_accept"):
		botao = 1
	else:
		botao = 0
	#condição para sementes
	if Dados.semente > 0 and botao == 1 and trava_terra == 1 and trava_planta == 0:
		$AnimatedSprite2D.frame = 0
		show()
		trava_planta = 1
		Dados.semente -= 1
		botao = 0 
		
	#condição para crescimento
		
	if Dados.agua > 0 and botao == 1 and trava_terra == 1:
		Dados.agua -= 1
		for i  in range(1,5):
			await get_tree().create_timer(3.0).timeout
			$AnimatedSprite2D.frame = i
		leguminosa = 1
	if leguminosa == 1 and botao == 1 and trava_terra == 1:
		$AnimatedSprite2D.frame = 5
		await get_tree().create_timer(1.0).timeout
		hide()
		Dados.tomate +=1
		trava_planta = 0
		leguminosa = 0

func _on_body_entered(body: Node2D) -> void:
	trava_terra = 1
	
func _on_body_exited(body: Node2D) -> void:
	trava_terra = 0
