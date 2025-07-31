extends Control

func _ready():
	$ProgressBar.max_value = len(get_parent().get_parent().scenetobuild.keys())
func _process(delta: float) -> void:
	$ProgressBar.value = get_parent().get_parent().ki
	if get_parent().get_parent().ki >= len(get_parent().get_parent().scenetobuild.keys()):
		queue_free()
