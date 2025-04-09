class_name Boss
extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
const INSTANCIA_BARRIL = preload("res://enemigos/barrel_yellow.tscn")

func launch_barrel():
	var instancia_barril = INSTANCIA_BARRIL.instantiate()
	instancia_barril.position = $CharacterSquareRed/CharacterHandRed.position
	add_child(instancia_barril)
	animation_player.play("reposo")

func _on_timer_timeout() -> void:
	animation_player.play("lanzar")
	$Timer.wait_time = randf_range(2, 5)
