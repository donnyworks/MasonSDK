extends CharacterBody3D

func _ready():
	var ball_mat = StandardMaterial3D.new()
	$CSGSphere3D.material = ball_mat
	if gel_power == 0:
		$OmniLight3D.light_color = Color(0,0,1,1)
		$CSGSphere3D.material.albedo_color = Color(0,0,1,1)
	if gel_power == 1:
		$OmniLight3D.light_color = Color(1,0,0,1)
		$CSGSphere3D.material.albedo_color = Color(1,0,0,1)
	velocity = (transform.basis * Vector3.ONE).normalized()
@export var gel_power = 0
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CSGShape3D and is_on_floor():
		var geldecal = load("res://instances/aperture/geldecal.tscn").instantiate()
		geldecal.position = position
		geldecal.gel_power = gel_power
		get_parent().add_child(geldecal)
		queue_free()
	pass # Replace with function body.
