extends Node2D

const SCENE_FINISH = "res://escenas/scene_finish.tscn"

signal player_life_updated(new_player_life)
signal time_updated(seconds_left)

@export var player_life = 3
@export var time_seconds = 100

func game_over():
	get_tree().change_scene_to_file(SCENE_FINISH)
	
func game_victory():
	var scene_finish_instance = preload(SCENE_FINISH).instantiate()
	scene_finish_instance.set_title("HAS GANADO")
	add_child(scene_finish_instance)
	

func _on_personaje_player_hit() -> void:
	print("GameController se ha enterado de que el jugador sufrio daño")
	if player_life > 0:
		player_life = player_life - 1
		player_life_updated.emit(player_life)
	else:
		game_over()
	


func _on_area_2d_green_flag_body_entered(_body: Node2D) -> void:
	game_victory()


func _on_timer_timeout() -> void:
	if time_seconds > 0:
		time_seconds = time_seconds - 1
	if time_seconds <= 0:
		game_over()
	time_updated.emit(time_seconds)
