extends TextureButton

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setup(image: Texture2D, frame: Texture2D) -> void:
	item_image.texture = image
	frame_image.texture = frame


func _on_pressed() -> void:
	pass # Replace with function body.
