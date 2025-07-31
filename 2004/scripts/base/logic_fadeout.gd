extends Node
class_name logic_fadeout

# rushed for idc 2004
# plz fix
@export var startFadedOut := false
var idcFadeout = ColorRect.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not startFadedOut:
		idcFadeout.color = Color(0,0,0,0)
	else:
		idcFadeout.color = Color(0,0,0,1)
	idcFadeout.size = Vector2(640,480)
	add_child(idcFadeout)
	pass # Replace with function body.

var fadeout := false
var fadein := false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fadein and idcFadeout.color.a > 0:
		idcFadeout.color.a -= delta
	else:
		fadein = false
	if fadeout and idcFadeout.color.a < 1:
		idcFadeout.color.a += delta
	else:
		fadeout = false
	
	pass

func fired(param: String):
	if param == "fadein":
		fadein = true
	if param == "fadeout":
		fadeout = true
	
