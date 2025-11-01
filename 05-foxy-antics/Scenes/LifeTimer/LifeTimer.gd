extends Node

@export var life_time: float = 4.0

func _ready() -> void:
	await get_tree().create_timer(life_time).timeout
	get_parent().call_deferred("queue_free")
