extends Node3D
@export var max_oc_generate = 16
@onready var initial_tile = get_node("officecomplex_rangen01")
func _process(delta):
	var oc = 0
	var ocd = []
	for i in get_children():
		if i is point_officecomplex_rangen_object:
			oc += 1
			ocd.append(i)
	if oc > max_oc_generate:
		if ocd[0] == initial_tile:
			remove_child(ocd[0])
			ocd.pop_at(0)
		remove_child(ocd[0])
		remove_child(ocd[1])
		remove_child(ocd[2])
		remove_child(ocd[3])
		ocd.pop_at(0)
		ocd.pop_at(0)
		ocd.pop_at(0)
		ocd.pop_at(0)
