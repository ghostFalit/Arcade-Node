extends CanvasLayer

func _ready() -> void:
	Events.score_updated.connect(_on_score_updated)
	Events.lives_updated.connect(_on_lives_updated)
	Events.game_over.connect(_on_game_over)
	Events.level_completed.connect(_on_level_completed)

func _on_score_updated(new_score: int) -> void:
	$MarginContainer/HBoxContainer/ScoreLabel.text = "Score: " + str(new_score)
	
func _on_lives_updated(new_lives: int) -> void:
	$MarginContainer/HBoxContainer/LivesLabel.text = "Lives: " + str(new_lives)
	
func _on_game_over() -> void:
	$Overlay/CenterContainer/VBoxContainer/MessageLabel.text = "GAME OVER"
	$Overlay.visible = true
	
func _on_level_completed() -> void:
	$Overlay/CenterContainer/VBoxContainer/MessageLabel.text = "YOU WIN!"
	$Overlay.visible = true

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
