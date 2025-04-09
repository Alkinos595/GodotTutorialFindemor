extends Camera2D

@export var object_to_follow:Node2D

func _process(_delta: float) -> void:
	if object_to_follow != null:
		position = object_to_follow.position

func _physics_process(_delta: float) -> void:
	pass
