extends Area3D
class_name trigger_objective

@export var title : String

@export_multiline var content : String

@export var timeout := 2.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered",be)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func be(body:Node3D):
	if body is Player3D:
		ObjectiveManager.createPopup(title,content,timeout)
		queue_free()
