extends Control


func _on_file_dialog_file_selected(path: String) -> void:
	$env_maploader.LoadScene(path)
	pass # Replace with function body.
