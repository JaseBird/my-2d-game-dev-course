extends Control

@onready var tile_grid: GridContainer = $UI/TileGrid
@onready var sound: AudioStreamPlayer = $Sound
@onready var scorer: Scorer = $Scorer
@onready var moves_label: Label = $UI/MarginContainer/VBoxContainer/HBoxMoves/MovesLabel
@onready var pairs_label: Label = $UI/MarginContainer/VBoxContainer/HBoxPairs/PairsLabel


const MEMORY_TILE = preload("res://Scenes/MemoryTile/MemoryTile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _enter_tree() -> void:
	SignalHub.on_level_selected.connect(_on_level_selected)


func _process(delta: float) -> void:
	moves_label.text = scorer.get_moves_made_str()
	pairs_label.text = scorer.get_pairs_made_str()	


func add_memory_tile(image: Texture2D, frame: Texture2D) -> void:
	var mt: MemoryTile = MEMORY_TILE.instantiate()
	tile_grid.add_child(mt)
	mt.setup(image, frame)


func _on_exit_button_pressed() -> void:
	for t in tile_grid.get_children():
		t.queue_free()
	SignalHub.on_game_exit_pressed.emit()
	SoundManager.play_button_click(sound)


func _on_level_selected(level_num: int) -> void:
	var lds: LevelDataSelector = LevelDataSelector.get_level_selection(level_num)
	var fi: Texture2D = ImageManager.get_random_frame_image()
	tile_grid.columns = lds.get_num_cols()
	for im in lds.get_selected_images():
		add_memory_tile(im, fi)
	scorer.clear_new_game(lds.get_target_pairs())
