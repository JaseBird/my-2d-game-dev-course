extends CharacterBody2D

class_name Tappy

const GRAVITY: float = 1000.0
const POWER: float = -350.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	
	if is_on_floor() == true:
		gameover()

func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("power")


func gameover() -> void:
	animated_sprite_2d.stop()
	sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
