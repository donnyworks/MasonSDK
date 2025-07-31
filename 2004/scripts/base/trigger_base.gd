extends Area3D
class_name BaseTrigger
## The base trigger class, to be instantiated.

# ------------------------------------------------
# OldKit:BaseTrigger - The base trigger class
# (C) 1996-2002 DonnyWorks Systems
# ------------------------------------------------

#outputs lol
@export var output : Node
@export var parameter : String
@export_enum("All","Player Only","Prop Only","NPC Only","Player+NPC") var trigger_type = 0 ## What type of entities should this trigger fire?

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered",_touched)
	pass # Replace with function body.

func _touched(body: Node3D) -> void:
	match trigger_type:
		0:
			if body is RigidBody3D or body is CharacterBody3D:
				if output != null:
					output.fired(parameter)
				touched(body)
		1:
			if body is Player3D:
				if output != null:
					output.fired(parameter)
				touched(body)
		2:
			if body is RigidBody3D:
				if output != null:
					output.fired(parameter)
				touched(body)
		3:
			if body is CharacterBody3D and not body is Player3D:
				if output != null:
					output.fired(parameter)
				touched(body)
		4:
			if body is CharacterBody3D:
				if output != null:
					output.fired(parameter)
				touched(body)
func touched(body: Node3D) -> void: ## Override this function with whatever the hell your trigger is supposed to do.
	pass
