extends Node2D
var abobora = preload("res://abobora.tscn")
var canteiro = preload("res://canteiro.tscn")
var tomate = preload("res://tomate.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("w"):
		var instance = canteiro.instantiate()
		instance.position = $Didi.position
		add_child(instance)
		pass
		
	if Input.is_action_just_pressed("space") and Dados.semente_abobora > 0 and Canteiro.trava_terra == 1 and Abobora.trava_planta == 0:
		var instance = abobora.instantiate()
		instance.position = $Didi.position
		add_child(instance)
		pass
