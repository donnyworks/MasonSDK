extends Node
class_name GlobalScope
### Do not spawn.

# -----------------------------------------------------
# OldKit:GlobalScope
# Contains global content for the kit.
# -----------------------------------------------------
enum Cause{
	CAUSE_DEATH, 
	CAUSE_BULLET, 
	CAUSE_GENERIC, 
	CAUSE_INCINERATION, 
	CAUSE_PHYSICS, 
	CAUSE_FALL,
	CAUSE_LACERATION
} ## Enum that defines player cause of death.

enum DamageType{
	DMG_BULLET,
	DMG_MELEE,
	DMG_FALL,
	DMG_PHYSICS,
	DMG_FLAME,
	DMG_TRIGGER
} ## Enum defining every type of damage.

enum PlayerState{
	PLR_ALIVE,
	PLR_DEAD,
	PLR_LIMBO
} ## The hell is limbo????

enum GameState{
	ACTIVE,
	MENU,
	PAUSED
}

var cheat_full_pause_disabled = false

var current_state : GameState = GameState.ACTIVE

var last_save : String

var qsave_enabled = true

enum GraphicsCard{
	GEFORCE_256_DDR,
	GEFORCE_3_TI500,
	GEFORCE_FX_5200,
}

enum Error{
	DW3D_INVALID_CHUNK_SIZE,
	DW3D_INVALID_LEVEL_FILE,
	DW3D_GENERIC,
	PI_INVALID,
	PIE_YUMMY,
	DW3D_INVALID_LEVEL_DATA
}

# 128, 240, 250 mhz
# NONE, 4P+1V, 4P+2V shaders
# DX7, DX8, DX9 graphics
# 17, 23, 30 fps
# 10, 20, 24 tps

var currentCard := GraphicsCard.GEFORCE_FX_5200
var graphicsLevel := 9
var fps := 30
var tps := 24

func EngineError(error:String,type:GlobalScope.Error):
	match type:
		GlobalScope.Error.DW3D_INVALID_CHUNK_SIZE:
			OS.alert("Invalid Chunk Size trying to load level.","Engine Error")
			get_tree().quit()
		GlobalScope.Error.DW3D_INVALID_LEVEL_FILE:
			OS.alert("Engine failed to load level file. (May be corrupted.)","Engine Error")
			get_tree().quit()
		GlobalScope.Error.DW3D_GENERIC:
			OS.alert(error,"Engine Error")
			get_tree().quit()
		GlobalScope.Error.PI_INVALID:
			OS.alert("PI was flagged as not being correct (how?!)","Engine Error")
			get_tree().quit()
		GlobalScope.Error.PIE_YUMMY:
			OS.alert(error,"Pie Error")
			get_tree().quit()
		GlobalScope.Error.DW3D_INVALID_LEVEL_DATA:
			OS.alert("Retailer Game Directory level data invalid.","Engine Error")
			get_tree().quit()
		
		pass
func changeCard(card):
	match card:
		GraphicsCard.GEFORCE_256_DDR:
			graphicsLevel = 7
			fps = 17
			tps = 10
		GraphicsCard.GEFORCE_3_TI500:
			graphicsLevel = 8
			fps = 23
			tps = 20
		GraphicsCard.GEFORCE_FX_5200:
			graphicsLevel = 9
			fps = 30
			tps = 24
	currentCard = card
	Engine.max_fps = fps
	Engine.physics_ticks_per_second = tps

func loadSave(save_name:String):
	if FileAccess.file_exists("user://save/" + save_name + ".scn"):
		get_tree().change_scene_to_packed(ResourceLoader.load("user://save/" + save_name + ".scn"))
	else:
		return -1
	pass
var last_scene = null
func loadLastSave():
	Globals.qsave_enabled = true
	if loadSave(last_save) == -1:
		get_tree().reload_current_scene()
		saveGame("lastSave")
	pass

func saveGame(save_name:String):
	if not qsave_enabled:
		return
	last_save = save_name
	var ps = PackedScene.new()
	ps.pack(get_tree().current_scene)
	ResourceSaver.save(ps,"user://save/" + save_name + ".scn")
	pass

var bitc = Label.new()
var playerstate = null
# Called when the node enters the scene tree for the first time.
func _ready():
	bitc.visible = false
	add_child(bitc)
	process_mode = Node.PROCESS_MODE_ALWAYS
	if not DirAccess.dir_exists_absolute("user://save"):
		DirAccess.make_dir_absolute("user://save")
	changeCard(currentCard)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_1):
		changeCard(GraphicsCard.GEFORCE_256_DDR)
	if Input.is_key_pressed(KEY_2):
		changeCard(GraphicsCard.GEFORCE_3_TI500)
	if Input.is_key_pressed(KEY_3):
		changeCard(GraphicsCard.GEFORCE_FX_5200)
	if Input.is_key_pressed(KEY_4):
		bitc.visible = true
	bitc.text = str(Engine.get_frames_per_second())
	pass
