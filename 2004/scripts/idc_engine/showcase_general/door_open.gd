extends Area3D


enum State{STATE_SHUT,STATE_OPEN}

@export var state := State.STATE_SHUT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_touched != null and Input.is_action_just_pressed("use"):
		if state == State.STATE_SHUT:
			state = State.STATE_OPEN
		else:
			state = State.STATE_SHUT
	pass



var is_touched = null
func _on_body_entered(body: Node3D) -> void:
	if body is Player3D:
		is_touched = body
	pass # Replace with function body.


func _on_body_exited(body: Node3D) -> void:
	if body is Player3D:
		is_touched = null
	pass # Replace with function body.
