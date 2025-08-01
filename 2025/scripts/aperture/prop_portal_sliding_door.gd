extends Node3D

var open = false
var close = true
@export var speed = 100.0
func fired(type:String):
	if type == "Open":
		open = true
		close = false
	if type == "Close":
		close = true
		open = false

func _process(delta: float) -> void:
	if $doorhalf2.position.x < 0:
		$doorhalf2.position.x = 0
		$doorhalf2.velocity = Vector3.ZERO
		close = false
	if $doorhalf1.position.x > 0:
		$doorhalf1.position.x = 0
		$doorhalf1.velocity = Vector3.ZERO
		close = false
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
