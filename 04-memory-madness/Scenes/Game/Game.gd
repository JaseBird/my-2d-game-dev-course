extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	SignalHub.on_game_exit_pressed.emit()
