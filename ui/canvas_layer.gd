extends CanvasLayer

const TILE_HEART_EMPTY = preload("res://assets/ui/tile_heart_empty.png")
const TILE_HEART_MORADO = preload("res://assets/ui/tile_heart_morado.png")

func _on_game_controller_player_life_updated(new_player_life: Variant) -> void:
	$HBoxContainer/TextureRect.texture = TILE_HEART_MORADO if new_player_life >= 1 else TILE_HEART_EMPTY
	$HBoxContainer/TextureRect2.texture = TILE_HEART_MORADO if new_player_life >= 2 else TILE_HEART_EMPTY
	$HBoxContainer/TextureRect3.texture = TILE_HEART_MORADO if new_player_life >= 3 else TILE_HEART_EMPTY


func _on_game_controller_time_updated(seconds_left: Variant) -> void:
	$TextureRect/Label.text = str(seconds_left)
