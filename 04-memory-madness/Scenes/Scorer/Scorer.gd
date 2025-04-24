extends Node
class_name Scorer

static  var SelectionEnabled: bool = true

@onready var sound: AudioStreamPlayer = $Sound
@onready var reveal_timer: Timer = $RevealTimer

var _selections: Array[MemoryTile]
var _target_pairs: int = 0
var _moves_made: int = 0
var _pairs_made: int = 0

func _enter_tree() -> void:
	SignalHub.on_tile_selected.connect(on_tile_selected)
	SignalHub.on_game_exit_pressed.connect(on_game_exit_pressed)


func clear_new_game(target_pairs: int) -> void:
	_selections.clear()
	_target_pairs = target_pairs
	_moves_made = 0
	_pairs_made = 0


func check_for_pair() -> void:
	if _selections[0].matches_other_tile(_selections[1]) == true:
		_selections[0].kill_on_success()
		_selections[1].kill_on_success()
		SoundManager.play_sound(sound, SoundManager.SOUND_SUCCESS)


func process_pair() -> void:
	if _selections.size() != 2:
		return
	SelectionEnabled = false
	reveal_timer.start()
	check_for_pair();


func on_tile_selected(tile: MemoryTile) -> void:
		if tile in _selections:
			return
		_selections.append(tile)
		SoundManager.play_tile_click(sound)
		process_pair()


func on_game_exit_pressed() -> void:
	reveal_timer.stop()


func _on_reveal_timer_timeout() -> void:
	for s in _selections:
		s.reveal(false)
	_selections.clear()
	SelectionEnabled = true
