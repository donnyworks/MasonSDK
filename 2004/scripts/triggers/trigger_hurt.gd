extends BaseTrigger
class_name trigger_hurt
### Trigger entity that harms the entity type specified

# ------------------------------------------
# OldKit:trigger_hurt
# Desc: OWWWWWWWWWWWWWWWWWWWW
# (C) 1996-2002 DonnyWorks Systems
# ------------------------------------------

@export var damage_delt := 20.0
@export var damage_type : GlobalScope.DamageType = GlobalScope.DamageType.DMG_TRIGGER

var touched_body = null

func _ready():
	super._ready()
	connect("body_exited",not_touched)

func _process(delta: float) -> void:
	if touched_body != null:
		touched_body.DealDamage(damage_delt,damage_type)

func touched(body: Node3D) -> void:
	if body is CharacterBody3D:
		if body.get("health") != null:
			touched_body = body

func not_touched(body: Node3D) -> void:
	if body is CharacterBody3D:
		if body.get("health") != null:
			touched_body = null
