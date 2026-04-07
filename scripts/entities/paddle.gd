extends AnimatableBody2D
var screen_width: float
var half_width: float
var min_x: float
var max_x: float
var target_x: float

func _ready() -> void:
	screen_width = get_viewport_rect().size.x
	half_width = $CollisionShape2D.shape.size.x / 2.0
	min_x = half_width
	max_x = screen_width - min_x
	target_x = global_position.x
	add_to_group("paddle")
	Events.paddle_slider_moved.connect(_on_slider_moved)
	
func _on_slider_moved(normalized_x: float) -> void:
	target_x = lerpf(min_x, max_x, normalized_x)
	
func _physics_process(delta: float) -> void:
	global_position.x = target_x
