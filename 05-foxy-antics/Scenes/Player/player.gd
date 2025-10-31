extends CharacterBody2D

class_name Player

@onready var sprite_2d: Sprite2D = $Sprite2D

const GRAVITY: float = 690.0
const JUMP_VELOCITY = -270.0
const RUN_SPEED = 120.0


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	velocity.x = RUN_SPEED * Input.get_axis("left", "right")
	
	if not is_equal_approx(velocity.x, 0.0):
		sprite_2d.flip_h = velocity.x < 0
		
	jump()
	move_and_slide()

func jump() -> void:
	if is_on_floor() and Input.is_action_just_pressed("jump") == true:
		velocity.y = JUMP_VELOCITY
