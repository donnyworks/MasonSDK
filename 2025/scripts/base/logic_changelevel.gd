extends Node
class_name logic_changelevel

# -------------------------------------------------------
# logic_changelevel : The level transition entity (real)
# (C) 1996-2001 DonnyWorks Software
# -------------------------------------------------------
@export var player : Player3D ## Required.
@export var developer : String = "donovan" ## The developer who made the map
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fired(param:String):
	print("Changing levels.")
	Globals.playerstate = player.duplicate()
	get_tree().change_scene_to_file("res://maps/" + developer + "/" + param + ".tscn")
