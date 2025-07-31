extends Node
class_name logic_relay
@export var toFire = {NodePath():"example"}
func fired(parameter:String):
	for i in toFire:
		print(i)
		get_node(i).fired(toFire[i])
