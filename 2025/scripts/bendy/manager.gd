extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func createPopup(title:String,subtitle:String,time:float):
	$labelbox/title.text = title
	$labelbox/objectivetext.text = subtitle
	$AnimationPlayer.play("popup")
	await get_tree().create_timer(time).timeout
	$AnimationPlayer.play("popdown")
