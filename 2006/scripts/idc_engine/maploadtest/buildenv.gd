extends Control

var dwlf = {"version":2,"scene":{}}
var bpath = null
var pathed = ""
func _on_file_dialog_file_selected(path: String) -> void:
	pathed = path
	bpath = load(path).instantiate()
	#get_tree().quit()
	pass # Replace with function body.

func _process(delta):
	if bpath != null:
		for i in bpath.get_children():
			if i is CSGShape3D:
				dwlf.scene[i.name] = {"type":"mesh","collide":i.use_collision,"transform":i.transform,"mesh":i.get_meshes()[1]}
			if i is Player3D:
				dwlf.scene[i.name] = {"type":"point_prefab","transform":i.transform,"prefab":"player"}
			if i is point_prefab:
				dwlf.scene[i.name] = {"type":"point_prefab","transform":i.transform,"prefab":i.PrefabName}
			if i is OmniLight3D or i is idc_point_light:
				dwlf.scene[i.name] = {"type":"light","transform":i.transform,"range":i.omni_range,"color":i.light_color,"shadows":i.shadow_enabled,"intensity":i.light_energy}
			if i is Node3D and not i is CSGShape3D:
				for x in i.get_children():
					if x is CSGShape3D:
						dwlf.scene[i.name + "." + x.name] = {"type":"mesh","collide":x.use_collision,"transform":x.transform + i.transform,"mesh":x.get_meshes()[1]}
					if x is Player3D:
						dwlf.scene[i.name + "." + x.name] = {"type":"point_prefab","transform":x.transform + i.transform,"prefab":"player"}
					if x is point_prefab:
						dwlf.scene[i.name + "." + x.name] = {"type":"point_prefab","transform":x.transform + i.transform,"prefab":x.PrefabName}
					if x is OmniLight3D or x is idc_point_light:
						dwlf.scene[i.name + "." + x.name] = {"type":"light","transform":x.transform + i.transform,"range":x.omni_range,"color":x.light_color,"shadows":x.shadow_enabled,"intensity":i.light_energy}
		print(dwlf.scene)
		var output = FileAccess.open(pathed.replace(".tscn",".dwlf"),FileAccess.WRITE)
		output.store_var(dwlf,true)
		output.close()
		get_tree().change_scene_to_file("res://maps/mike/idc_level_loader.tscn")
