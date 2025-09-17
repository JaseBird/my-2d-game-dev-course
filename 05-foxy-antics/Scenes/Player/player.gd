extends CharacterBody2D

class_name Player

const GRAVITY: float = 690.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	move_and_slide()
