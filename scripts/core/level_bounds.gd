extends Node

func _ready() -> void:
	Events.layout_calculated.connect(_on_layout_calculated)
	
func _on_layout_calculated(screen_size: Vector2, slider_y: float, paddle_y: float) -> void:
	var thickness = 100.0
	#TopWall
	$Walls/TopWall.shape.size = Vector2(screen_size.x + thickness * 2.0, thickness)
	$Walls/TopWall.position = Vector2(screen_size.x / 2.0, -thickness / 2.0)
	#LeftWall
	$Walls/LeftWall.shape.size = Vector2(thickness, screen_size.y * 2.0)
	$Walls/LeftWall.position = Vector2(-thickness / 2.0, screen_size.y)
	#RightWall
	$Walls/RightWall.shape.size = Vector2(thickness, screen_size.y * 2.0)
	$Walls/RightWall.position = Vector2(screen_size.x + thickness / 2.0, screen_size.y)
	#BottomZone 
	$Killzone/BottomZone.shape.size = Vector2(screen_size.x + thickness * 2.0, thickness)
	$Killzone/BottomZone.global_position = Vector2(screen_size.x / 2.0, slider_y + 150.0)
	
func _on_killzone_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		body.queue_free()
		Events.ball_lost.emit()
		
