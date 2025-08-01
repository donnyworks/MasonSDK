extends Node
class_name logic_errorinvoker

@export var error_type = GlobalScope.Error.DW3D_GENERIC

func fired(param:String):
	Globals.EngineError(param,error_type)
	pass
