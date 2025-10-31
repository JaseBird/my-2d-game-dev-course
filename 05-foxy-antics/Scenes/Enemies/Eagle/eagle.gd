extends EnemyBase

@export var fly_speed: Vector2 = Vector2(35, 15)

@onready var player_detector: RayCast2D = $PlayerDetector
@onready var direction_timer: Timer = $DirectionTimer

var _fly_direction: Vector2 = Vector2.ZERO
var _can_shoot: bool = true


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	velocity = _fly_direction
	move_and_slide()
	shoot()


func fly_to_player() -> void:
	# flip sprite
	flip_me()
	# set a fly direction
	var x_dir: float = 1.0 if animated_sprite_2d.flip_h else -1.0
	_fly_direction = Vector2(x_dir, 1) * fly_speed


func shoot() -> void:
	if player_detector.is_colliding() == true and _can_shoot == true:
		_can_shoot = false
	
	# reset shoot
	if player_detector.is_colliding() == false and _can_shoot == false:
		_can_shoot = true


# Node signal functions
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
		animated_sprite_2d.play("fly")
		direction_timer.start()
		fly_to_player()


func _on_direction_timer_timeout() -> void:
	fly_to_player()
