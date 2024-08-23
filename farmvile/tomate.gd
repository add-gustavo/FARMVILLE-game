extends Area2D

var semente = 1
func _ready() -> void:
	hide()
func _process(delta: float) -> void:
	$"../dados/semente_tomate".text = str(semente)
	pass

func _on_body_entered(body: Node2D) -> void:
	if semente >= 1:
		show()
		semente -= 1
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
