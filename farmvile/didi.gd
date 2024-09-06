
extends CharacterBody2D
# speed in pixels/sec
var speed = 100
var agua = 0
var semente = 0
 
func _physics_process(_delta: float) -> void:
	if agua == 1 and Input.is_action_just_pressed("ui_accept"):
		Dados.agua +=1 
	
	if semente == 1 and Input.is_action_just_pressed("ui_accept"):
		Dados.semente_tomate +=1 
# setup direction of movement
	var direction = Input.get_vector("left", "right", "up", "down")
# stop diagonal movement by listening for input then setting axis to zero
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y = 0
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
		$AnimatedSprite2D.play("parado")
#normalize the directional movement
	direction = direction.normalized()
# setup the actual movement
	velocity = (direction * speed)
	move_and_slide() 
		
	
	if Input.is_action_just_pressed("right") || Input.is_action_just_pressed("up"):
		$AnimatedSprite2D.play("andando_direita") 
	elif Input.is_action_just_pressed("left") || Input.is_action_just_pressed("down"):
		$AnimatedSprite2D.play("andando_esquerda")
	


func _on_baldeagua_body_entered(_body: Node2D) -> void:
	agua = 1
func _on_baldeagua_body_exited(_body: Node2D) -> void:
	agua = 0

func _on_bausementes_body_entered(_body: Node2D) -> void:
	semente = 1
func _on_bausementes_body_exited(_body: Node2D) -> void:
	semente = 0

#func _on_baldelegumes_body_entered(body: Node2D) -> void:
	#Dados.legumes -=1
