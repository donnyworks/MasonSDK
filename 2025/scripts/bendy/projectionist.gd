extends Node3D


@onready var spot_light_3d: SpotLight3D = $SpotLight3D
@onready var sub_viewport: SubViewport = $SubViewport

var projector_texture:ImageTexture

func _ready() -> void:
	var image = sub_viewport.get_texture().get_image()
	projector_texture = ImageTexture.create_from_image(image)
	spot_light_3d.light_projector = projector_texture


func _process(delta: float) -> void:
	if not projector_texture:
		return
	var image = sub_viewport.get_texture().get_image()
	projector_texture.set_image(image)
