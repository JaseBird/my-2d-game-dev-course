extends CharacterBody2D

class_name Player

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var debug_label: Label = $DebugLabel

const GRAVITY: float = 690.0
const JUMP_VELOCITY = -370.0
const RUN_SPEED = 120.0
const MAX_FALL = 350.0

var fell_off_y: float = 200.0

func _enter_tree() -> void:
	add_to_group(Constants.PLAYER_GROUP)

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	velocity.y = clamp(velocity.y, JUMP_VELOCITY, MAX_FALL)
	velocity.x = RUN_SPEED * Input.get_axis("left", "right")
	
	if not is_equal_approx(velocity.x, 0.0):
		sprite_2d.flip_h = velocity.x < 0
		
	jump()
	move_and_slide()
	update_debug_label()
	fallen_off()

func jump() -> void:
	if is_on_floor() and Input.is_action_just_pressed("jump") == true:
		velocity.y = JUMP_VELOCITY

func update_debug_label() -> void:
	var ds: String = ""
	ds += "Floor:%s\n" % [is_on_floor()]
	ds += "V:%.1f,%.1f\n" % [velocity.x, velocity.y]
	ds += "P:%.1f,%.1f" % [global_position.x, global_position.y]
	debug_label.text = ds

func fallen_off() -> void:
	if global_position.y > fell_off_y:
		queue_free()
