extends Node
class_name env_maploader

var maploaderver = 2
var maploadindex = {1:"IDC 2006 Engine Base",2:"IDC 2006 + LLE Support"}
var scenetobuild = {}
var maploadversion = 0
var mappath = ""
@export var delaytime = 0.0
func _ready():
	var env = WorldEnvironment.new()
	env.environment = load("res://scripts/idc_engine/maploadtest/mapbuild_env.tres")
	add_child.call_deferred(env)
func LoadScene(path:String):
	mappath = path
	var f = FileAccess.open(path,FileAccess.READ)
	var data = f.get_var(true)
	f.close()
	if data.version > maploaderver:
		print("MapLoader cannot work with verison " + str(data.version) + " map files!")
	else:
		print("Built with: " + maploadindex[data.version])
		print("Internal version: " + str(data.version))
		maploadversion = data.version
		print("Reconstructing scene...")
		scenetobuild = data.scene
	pass
var ki = 0
var dtpassed = 0.0
func _process(delta):
	if scenetobuild == {}:
		pass
	else:
		if delaytime > 0:
			if dtpassed < delaytime:
				dtpassed += delta
			else:
				nextStep()
				dtpassed = 0.0
		else:
			nextStep()
var mapLoadComplete = false
func nextStep():
	if ki < len(scenetobuild.keys()):
		var obj = scenetobuild[scenetobuild.keys()[ki]]
		var oname = scenetobuild.keys()[ki]
		print("Object name: " + oname)
		print("ClassID: " + obj.type)
		if maploadversion > 1:
			if obj.type == "mesh":
				print("Type of object: CSGMesh3D (internally, that is!)")
				var object = CSGMesh3D.new()
				object.name = oname
				object.use_collision = obj.collide
				object.transform = obj.transform
				object.mesh = obj.mesh
				add_child(object)
		else:
			if obj.type == "mesh":
				print("Type of object: CSGBox3D (internally, that is!)")
				var object = CSGBox3D.new()
				object.name = oname
				object.use_collision = obj.collide
				object.transform = obj.transform
				object.size = obj.mesh
				add_child(object)
		if obj.type == "point_prefab":
			print("Type of object: Prefab")
			var object = Node3D.new()
			object.name = oname
			object.script = load("res://scripts/idc_engine/maploadtest/point_prefab.gd")
			object.PrefabName = obj.prefab
			object.transform = obj.transform
			add_child(object)
		if obj.type == "light": # {"type":"light","transform":i.transform,"range":i.omni_range,"color":i.light_color,"shadows":i.shadow_enabled,"intensity":i.light_energy}
			print("Type of object: Point light (OmniLight3D)")
			var object = OmniLight3D.new()
			object.name = oname
			object.transform = obj.transform
			object.omni_range = obj.range
			object.light_color = obj.color
			object.shadow_enabled = obj.shadows
			object.light_energy = obj.intensity
			add_child(object)
		ki += 1
	else:
		mapLoadComplete = true
