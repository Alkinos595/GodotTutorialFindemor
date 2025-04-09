extends CanvasLayer

const LEVEL_1 = "res://escenas/level_1.tscn"

func set_title(title):
	$VBoxContainer/Label.text = title

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file(LEVEL_1)
