extends Node
class_name logic_randomfire

@export var entity : Node
@export var parameter := ""
@export var chance := 1000
@export var interval := 0.0
var testval = 0
func _ready():
	testval = randi_range(0,chance)
var elapsed := 0.0
func _process(delta):
	if elapsed >= interval:
		if randi_range(0,chance) == testval:
			entity.fired(parameter)
		elapsed = 0.0
	else:
		elapsed += delta
