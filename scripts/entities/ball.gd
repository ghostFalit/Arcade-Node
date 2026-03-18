extends CharacterBody2D

@export var speed: float = 600.0
@export var direction: Vector2 = Vector2.ZERO

# Physics of the Ball
func _physics_process(delta: float) -> void:
	var speed_vector = direction * speed
	var collision = move_and_collide(speed_vector * delta)
	if collision:
		var normal = collision.get_normal()
		direction = direction.bounce(normal).normalized()
