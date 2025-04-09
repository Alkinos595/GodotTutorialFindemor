class_name Personaje
extends CharacterBody2D

signal player_hit()

@export var gravity = 100
@export var jump_speed = 100
@export var speed_move = 100
@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:

	#Movimiento horizontal
	var direction = Input.get_axis("izq", "der")
	velocity.x = speed_move * direction
	if direction != 0:
		sprite_2d.scale.x = direction
	#Gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
	
	#Saltar
	var jump_pressed = Input.is_action_just_pressed("saltar")
	if jump_pressed and is_on_floor():
		velocity.y = velocity.y - jump_speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Un cuerpo ha entrado en el área", body.name)
	print("Aquí podriamos reproducir una animación de alegría")
	
func damage_received():
	print("Daño recibido")
	player_hit.emit()
