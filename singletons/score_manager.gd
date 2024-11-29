extends Node

var _score: int = 0
var _high_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func get_score() -> int:
	return _score


func get_high_score() -> int:
	return _high_score


func set_score(v: int) -> void:
	_score = v
	if _score > _high_score:
		_high_score = _score
	SignalManager.on_score_updated.emit(_score)


func increment_score() -> void:
	set_score(_score + 1)
