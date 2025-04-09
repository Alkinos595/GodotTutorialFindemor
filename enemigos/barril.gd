class_name Barril
extends RigidBody2D
const BARREL_RED = preload("res://assets/enemies/barrel_red.png")
@export var object_out_range = 1000
var damage_done = false

func _process(_delta: float) -> void:
	if position.y > object_out_range:
		queue_free()


func _on_body_entered(body: Node) -> void:
	if body is Personaje:
		if damage_done == false:
			print("Jugador herido")
			damage_done = true
			$BarrelYellowSprite.texture = BARREL_RED
			if body.has_method("damage_received"):
				body.damage_received()
