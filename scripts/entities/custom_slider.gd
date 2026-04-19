extends Control

@export var paddle_half_width: float = 60.0
@onready var knob = $Knob

func _ready() -> void:
	await get_tree().process_frame
	var center_y = (size.y - knob.size.y) / 2.0
	knob.position.y = center_y
	var center_x = size.x / 2.0
	var target_x = clampf(center_x, paddle_half_width, size.x - paddle_half_width)
	knob.position.x = target_x - (knob.size.x / 2.0)
	Events.paddle_exact_x_moved.emit(target_x)

func _gui_input(event: InputEvent) -> void:
	var is_valid_touch = (event is InputEventScreenTouch and event.is_pressed()) or event is InputEventScreenDrag
	var is_valid_mouse = (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed()) or (event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT))
	if is_valid_touch or is_valid_mouse:
		var touch_x = event.position.x
		var target_x = clampf(touch_x, paddle_half_width + 1.0, size.x - paddle_half_width + 1.0)
		knob.position.x = target_x - (knob.size.x / 2.0)
		Events.paddle_exact_x_moved.emit(target_x)
