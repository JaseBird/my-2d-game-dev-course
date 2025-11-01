extends CharacterBody2D

class_name EnemyBase

@export var points: int = 1
@export var speed: float = 30.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const FALL_OFF_Y: float = 800.0

var _gravity: float = 800.0
var _player_ref: Player

func _ready() -> void:
	_player_ref = get_tree().get_first_node_in_group(Constants.PLAYER_GROUP)
	if _player_ref == null:
		queue_free()


func _physics_process(delta: float) -> void:
	if global_position.y > FALL_OFF_Y:
		queue_free()


func flip_me() -> void:
	animated_sprite_2d.flip_h = global_position.x < _player_ref.global_position.x


func die() -> void:
	set_physics_process(false)
	queue_free()
	SignalHub.emit_on_create_object(global_position, Constants.ObjectType.EXPLOSION)
	SignalHub.emit_on_create_object(global_position, Constants.ObjectType.PICKUP)


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	pass # Replace with function body.


func _on_hitbox_area_entered(area: Area2D) -> void:
	die()
