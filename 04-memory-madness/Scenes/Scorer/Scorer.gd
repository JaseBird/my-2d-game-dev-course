extends Node
class_name Scorer

static  var SelectionEnabled: bool = true

@onready var sound: AudioStreamPlayer = $Sound

var _selections: Array[MemoryTile]


func _enter_tree() -> void:
	SignalHub.on_tile_selected.connect(on_tile_selected)


func on_tile_selected(tile: MemoryTile) -> void:
		if tile in _selections:
			return
		_selections.append(tile)
		SoundManager.play_tile_click(sound)
