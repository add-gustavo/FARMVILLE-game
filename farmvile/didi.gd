extends CharacterBody2D

const SPEED = 70.0
var agua = 0
var semente = 0
func _physics_process(delta: float) -> void:
	if agua == 1 and Input.is_action_just_pressed("ui_accept"):
		Dados.agua +=1 
	
	if semente == 1 and Input.is_action_just_pressed("ui_accept"):
		Dados.semente +=1 
	#direção do personagem
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("parado")
	move_and_slide()
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("andando_esquerda")
	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("andando_direita")

func _on_baldeagua_body_entered(body: Node2D) -> void:
	agua = 1
func _on_baldeagua_body_exited(body: Node2D) -> void:
	agua = 0

func _on_bausementes_body_entered(body: Node2D) -> void:
	semente = 1
func _on_bausementes_body_exited(body: Node2D) -> void:
	semente = 0

#func _on_baldelegumes_body_entered(body: Node2D) -> void:
	#Dados.legumes -=1
