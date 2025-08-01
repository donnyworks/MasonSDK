extends Sprite3D

var variance = [
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_03.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_07.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_01.png"),
	preload("res://materials/bendy/decals/dreamscometrue_02.png"),
	preload("res://materials/bendy/decals/dreamscometrue_03.png"),
	preload("res://materials/bendy/decals/dreamscometrue_04.png"),
	preload("res://materials/bendy/decals/dreamscometrue_05.png"),
	preload("res://materials/bendy/decals/dreamscometrue_06.png"),
	preload("res://materials/bendy/decals/dreamscometrue_07.png"),
	preload("res://materials/bendy/decals/dreamscometrue_08.png"),
	preload("res://materials/bendy/decals/dreamscometrue_09.png"),
	preload("res://materials/bendy/decals/dreamscometrue_10.png"),
	
]

var validity = [
	37,55,91,92,93,94,95,96,97,98,99
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var vari = randi_range(0,len(variance))
	print("Variant: " + str(vari))
	if not vari in validity:
		print("Not a ranchan!")
	else:
		print("Ranchan")
	texture = variance[vari]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cut"):
		_ready()
	pass
