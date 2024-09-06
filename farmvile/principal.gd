extends Node2D
var node = preload("res://canteiro.tscn")

func _ready() -> void:
	pass
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("w"):
		var instance = node.instantiate()
		instance.position = $Didi.position
		add_child(instance)
	#instance.position = ColorRect.position
	#instance.position = get_global_mouse_position()
		
