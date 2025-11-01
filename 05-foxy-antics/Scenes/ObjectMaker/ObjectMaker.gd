extends Node2D


const OBJECT_SCENES: Dictionary[Constants.ObjectType, PackedScene] = {
	Constants.ObjectType.BULLET_PLAYER: preload("uid://bsb20y7g82uh5"),
	Constants.ObjectType.BULLET_ENEMY: preload("uid://cs88dhbfhicwx")
}


# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	SignalHub.on_create_bullet.connect(on_create_bullet)


func on_create_bullet(pos: Vector2, dir: Vector2, speed: float, obj_type: Constants.ObjectType) -> void:
	if OBJECT_SCENES.has(obj_type) == false:
		return
	
	var new_bullet: Bullet = OBJECT_SCENES[obj_type].instantiate()
	new_bullet.setup(pos, dir, speed)
	call_deferred("add_child", new_bullet)
