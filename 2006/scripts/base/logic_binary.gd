extends Node
class_name logic_binary

@export var offstate : Node
@export var onstate : Node
@export var parent_trigger : BaseTrigger
var onstatus = ""
func _ready():
	parent_trigger.connect("body_exited",unfired)
func fired(param:String):
	onstatus = param
	onstate.fired(param)

func unfired(body):
	match parent_trigger.trigger_type:
		0:
			if body is RigidBody3D or body is CharacterBody3D:
				if offstate != null:
					offstate.fired(onstatus)
		1:
			if body is Player3D:
				if offstate != null:
					offstate.fired(onstatus)
		2:
			if body is RigidBody3D:
				if offstate != null:
					offstate.fired(onstatus)
		3:
			if body is CharacterBody3D and not body is Player3D:
				if offstate != null:
					offstate.fired(onstatus)
		4:
			if body is CharacterBody3D:
				if offstate != null:
					offstate.fired(onstatus)
	#offstate.fired(onstatus)
