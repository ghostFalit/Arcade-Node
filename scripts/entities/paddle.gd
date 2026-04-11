extends AnimatableBody2D

var screen_width: float = 0.0
var half_width: float = 0.0
var min_x: float = 0.0
var max_x: float = 0.0
var target_x: float = 0.0
var target_y: float = 0.0

func _ready() -> void:
	add_to_group("paddle")
	Events.paddle_slider_moved.connect(_on_slider_moved)
	Events.layout_calculated.connect(_on_layout_calculated)

func _on_layout_calculated(screen_size: Vector2, slider_y: float, paddle_y: float) -> void:
	screen_width = screen_size.x
	half_width = $CollisionShape2D.shape.size.x / 2.0
	min_x = half_width
	max_x = screen_width - min_x
	target_x = screen_width / 2.0
	target_y = paddle_y

func _on_slider_moved(normalized_x: float) -> void:
	if screen_width > 0:
		target_x = lerpf(min_x, max_x, normalized_x)

func _physics_process(delta: float) -> void:
	if screen_width > 0:
		global_position = Vector2(target_x, target_y)
