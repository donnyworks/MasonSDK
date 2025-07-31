extends Node3D

var open = false
var close = true
@export var speed = 1.0
func fired(type:String):
	if type == "Open":
		open = true
		close = false
	if type == "Close":
		close = true
		open = false

func _physics_process(delta: float) -> void:
	if open:
		$doorhalf1.velocity = Vector3(-speed*delta,0,0)
		$doorhalf2.velocity = Vector3(speed*delta,0,0)
	if close:
		$doorhalf1.velocity = Vector3(speed*delta,0,0)
		$doorhalf2.velocity = Vector3(-speed*delta,0,0)
	$doorhalf1.move_and_slide()
	$doorhalf2.move_and_slide()
	pass
