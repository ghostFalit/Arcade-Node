extends Node

signal brick_destroyed(points: int)
signal ball_lost
signal level_ready(total_bricks: int)
signal score_updated(new_score: int)
signal lives_updated(new_lives: int)
signal game_over
signal level_completed
signal paddle_slider_moved(normalized_x: float)
signal layout_calculated(screen_size: Vector2, slider_y: float, paddle_y: float)
