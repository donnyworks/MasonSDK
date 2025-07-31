extends RigidBody3D
class_name temp_brk_testmap

@export var breakapart_auto_enabled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is RigidBody3D and not body is temp_brk_testmap:
		if breakapart_auto_enabled:
			sleeping = false
			freeze = false
		pass
