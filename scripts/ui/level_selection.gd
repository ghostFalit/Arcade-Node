extends Control

func start_level(index: int) -> void:
	LevelManager.current_level_index = index
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
	
func _on_btn_level_1_pressed() -> void:
	start_level(0)
	
func _on_btn_level_2_pressed() -> void:
	start_level(1)
	
func _on_btn_level_3_pressed() -> void:
	start_level(2)
