extends AnimatedSprite2D
class_name Explosion


func _on_animation_finished() -> void:
	queue_free()
