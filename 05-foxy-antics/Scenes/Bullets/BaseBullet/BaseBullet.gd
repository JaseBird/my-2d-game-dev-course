extends Area2D

class_name Bullet

var _direction: Vector2 = Vector2(50, -50)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += _direction * delta


func setup(pos: Vector2, dir: Vector2, speed: float) -> void:
	_direction = dir.normalized() * speed
	global_position = pos


func _on_area_entered(area: Area2D) -> void:
	queue_free()
