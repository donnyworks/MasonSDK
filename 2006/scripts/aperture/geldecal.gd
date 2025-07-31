extends Node3D
var gel_power = 0
func _ready():
	var ball_mat = StandardMaterial3D.new()
	$CSGSphere3D.material = ball_mat
	if gel_power == 0:
		$OmniLight3D.light_color = Color(0,0,1,1)
		$CSGSphere3D.material.albedo_color = Color(0,0,1,1)
	if gel_power == 1:
		$OmniLight3D.light_color = Color(1,0,0,1)
		$CSGSphere3D.material.albedo_color = Color(1,0,0,1)
var dt = 0
func _physics_process(delta: float) -> void:
	dt = delta
func _on_area_3d_body_entered(body: Node3D) -> void:
	if gel_power == 0:
		if body is CharacterBody3D:
			body.velocity.y += 100*dt
	else:
		if body is CharacterBody3D:
			var m = (body.transform.basis * Vector3(5,0,5)).normalized()
			body.velocity.x = m.x
			body.velocity.y = m.y
	pass # Replace with function body.
