extends CharacterBody2D

const SPEED = 70.0
const JUMP_VELOCITY = -100.0
func _physics_process(delta: float) -> void:
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
