extends Node3D
class_name point_prefab

@export var PrefabName = "player"

func _ready():
	var fab = load("res://instances/" + PrefabName + ".tscn").instantiate()
	fab.position = position
	fab.rotation = rotation
	fab.scale = scale
	get_parent().add_child.call_deferred(fab)
	queue_free()
