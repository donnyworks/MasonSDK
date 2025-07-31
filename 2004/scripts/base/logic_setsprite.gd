extends Node
class_name logic_setsprite

@export var sprites = [] ## Just use Texture2D resouces lmao
@export var target : Sprite3D
func fired(param:String):
	print("Setting sprite.")
	target.texture = sprites[int(param)]
