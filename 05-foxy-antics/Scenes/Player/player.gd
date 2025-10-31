extends CharacterBody2D

class_name Player

const GRAVITY: float = 690.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const RUN_SPEED = 300.0


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	jump()
	move_and_slide()

func jump() -> void:
	if is_on_floor() and Input.is_action_just_pressed("jump") == true:
		velocity.y = JUMP_VELOCITY
