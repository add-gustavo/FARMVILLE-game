extends Area2D
var terra = 0
var plantar = 0
var planta = 0
func _ready() -> void:
	hide()
	
func _process(delta: float) -> void:
	$"../semente/semente_tomate".text = str(Dados.semente)
	if Input.is_action_just_pressed("ui_accept"):
		plantar = 1
	else:
		plantar = 0
	if Dados.semente >= 1 and plantar == 1 and terra == 1 and planta == 0:
		show()
		planta = 1
		Dados.semente -= 1
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 3
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 4
		await get_tree().create_timer(3.0).timeout
		planta = 0
	pass

func _on_body_entered(body: Node2D) -> void:
	terra = 1
	pass # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	terra = 0
	plantar = 0
	pass # Replace with function body.
