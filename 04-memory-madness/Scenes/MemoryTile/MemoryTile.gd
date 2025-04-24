extends TextureButton
class_name  MemoryTile

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reveal(false)


func reveal(r: bool) -> void:
	frame_image.visible = r
	item_image.visible = r


func setup(image: Texture2D, frame: Texture2D) -> void:
	item_image.texture = image
	frame_image.texture = frame


func matches_other_tile(other: MemoryTile) -> bool:
	return other != self and other.item_image.texture == item_image.texture


func kill_on_success() -> void:
	scale = Vector2.ZERO


func _on_pressed() -> void:
	if Scorer.SelectionEnabled == true:
		reveal(true)
		SignalHub.emit_on_tile_selected(self)
