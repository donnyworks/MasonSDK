extends Node
class_name logic_animation_trigger

@export var player : AnimationPlayer

func fired(string: String):
	player.play(string)
