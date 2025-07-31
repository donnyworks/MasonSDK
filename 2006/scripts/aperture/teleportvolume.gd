extends Area3D
class_name TeleportVolume ## Area3D volume that teleports the player to another one of itself.

@export var DestinationVolume: TeleportVolume
@export var isDestination := false
@export_enum("All","Player Only","Prop Only","NPC Only","Player+NPC") var trigger_type = 0 ## What type of entities should this trigger fire?
var fake_enums = ["Player+Prop","NPC+Prop","PlayerMP"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered",_touched)
	pass # Replace with function body.

func _touched(body: Node3D) -> void:
	if trigger_type < 0 or trigger_type > 4:
		OS.alert("Attempted to fire trigger with invalid TargetFlags " + str(trigger_type),"Engine Error")
		if trigger_type < 0 or trigger_type > 4 + len(fake_enums):
			print("SV_Trigger_OnFire: Failed to allocate TargetFlags instance with enumeration 'null'")
		else:
			print("SV_Trigger_OnFire: Failed to allocate TargetFlags instance with enumeration '" + fake_enums[trigger_type - len(fake_enums)] + "'")
		get_tree().quit()
	match trigger_type:
		0:
			if body is RigidBody3D or body is CharacterBody3D:
				if DestinationVolume != null:
					DestinationVolume.teleport_to(body,self)
				touched(body)
		1:
			if body is Player3D:
				if DestinationVolume != null:
					DestinationVolume.teleport_to(body,self)
				touched(body)
		2:
			if body is RigidBody3D:
				if DestinationVolume != null:
					DestinationVolume.teleport_to(body,self)
				touched(body)
		3:
			if body is CharacterBody3D and not body is Player3D:
				if DestinationVolume != null:
					DestinationVolume.teleport_to(body,self)
				touched(body)
		4:
			if body is CharacterBody3D:
				if DestinationVolume != null:
					DestinationVolume.teleport_to(body,self)
				touched(body)
func touched(body: Node3D) -> void: ## Override this function with whatever the hell your trigger is supposed to do.
	pass

func teleport_to(object,trigger):
	$CollisionShape3D.disabled = true
	object.global_position = global_position + object.global_position - trigger.global_position
