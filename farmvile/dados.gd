extends Node
var semente_tomate = 0
var abobora
var semente_abobora = 0
var agua = 0
var tomate = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$"../semente/semente_tomate".text = str("sementes-tomate: ",Dados.semente_tomate,"\n","agua: ", Dados.agua, "\n", "Tomate: ", Dados.tomate)
	pass
