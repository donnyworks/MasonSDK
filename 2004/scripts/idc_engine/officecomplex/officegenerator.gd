extends Node
class_name logic_idc_officegenerator
## Designed SPECIFICALLY for the IDC engine branch office complex. Must be the child of the office object called from.

var structures = [preload("res://instances/officecomplex/generated/1.tscn"),preload("res://instances/officecomplex/generated/2.tscn"),]
var fired_once = false
var generated = []
func fired(param:String):
	print("OHH LETS GENERATE")
	if not fired_once:
		fired_once = true
		var parent = get_parent()
		var sp1 = parent.get_node("spawnpoint_01")
		var sp2 = parent.get_node("spawnpoint_02")
		var sp3 = parent.get_node("spawnpoint_03")
		var sp4 = parent.get_node("spawnpoint_04")
		if sp1.position == sp2.position and sp2.position == sp3.position and sp3.position == sp4.position:
			var root = parent.get_parent()
			var obj1 = structures[randi_range(0,len(structures)-1)].instantiate()
			obj1.position = sp1.global_position
			root.add_child(obj1)
			parent.remove_child(sp1)
			parent.remove_child(sp2)
			parent.remove_child(sp3)
			parent.remove_child(sp4)
			generated.append(obj1)
		else:
			var root = parent.get_parent()
			var obj1 = structures[randi_range(0,len(structures)-1)].instantiate()
			var obj2 = structures[randi_range(0,len(structures)-1)].instantiate()
			var obj3 = structures[randi_range(0,len(structures)-1)].instantiate()
			var obj4 = structures[randi_range(0,len(structures)-1)].instantiate()
			obj1.position = sp1.global_position
			obj2.position = sp2.global_position
			obj3.position = sp3.global_position
			obj4.position = sp4.global_position
			var box1 = sp1.get_node_or_null("CSGBox3D")
			var box2 = sp2.get_node_or_null("CSGBox3D")
			var box3 = sp3.get_node_or_null("CSGBox3D")
			var box4 = sp4.get_node_or_null("CSGBox3D")
			if box1 != null:
				sp1.remove_child(box1)
			if box2 != null:
				sp2.remove_child(box2)
			if box3 != null:
				sp3.remove_child(box3)
			if box4 != null:
				sp4.remove_child(box4)
			obj1.get_node("spawnpoint_04").remove_child(obj1.get_node_or_null("spawnpoint_04/CSGBox3D"))
			obj4.get_node("spawnpoint_01").remove_child(obj4.get_node_or_null("spawnpoint_01/CSGBox3D"))
			obj2.get_node("spawnpoint_03").remove_child(obj2.get_node_or_null("spawnpoint_03/CSGBox3D"))
			obj3.get_node("spawnpoint_02").remove_child(obj3.get_node_or_null("spawnpoint_02/CSGBox3D"))
			root.add_child(obj1)
			root.add_child(obj2)
			root.add_child(obj3)
			root.add_child(obj4)
			generated.append(obj1)
			generated.append(obj2)
			generated.append(obj3)
			generated.append(obj4)
		# Add the code.
	else:
		print("oR lets not")
