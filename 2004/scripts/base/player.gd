extends CharacterBody3D
class_name Player3D
### The OldKit player object! DO NOT SPAWN! PLEASE, JUST USE THE PREFAB!

# ------------------------------------------------------
# OldKit:Player3D (Base Class / Default Player)
# (C) 1996-2001 DonnyWorks Systems. All rights reserved.
# ------------------------------------------------------

func DealDamage(amount:float,type:GlobalScope.DamageType):
	health -= amount
	if health <= 0:
		match type:
			GlobalScope.DamageType.DMG_TRIGGER:
				die(GlobalScope.Cause.CAUSE_GENERIC)
			GlobalScope.DamageType.DMG_FALL:
				die(GlobalScope.Cause.CAUSE_FALL)
			GlobalScope.DamageType.DMG_FLAME:
				die(GlobalScope.Cause.CAUSE_INCINERATION)
			GlobalScope.DamageType.DMG_BULLET:
				die(GlobalScope.Cause.CAUSE_BULLET)
			GlobalScope.DamageType.DMG_MELEE:
				die(GlobalScope.Cause.CAUSE_LACERATION)
			GlobalScope.DamageType.DMG_PHYSICS:
				die(GlobalScope.Cause.CAUSE_PHYSICS)
	pass

func die(cause:GlobalScope.Cause): ## Function caled to notify the player that they have, in fact, died.
	if state == GlobalScope.PlayerState.PLR_DEAD:
		return
	health = 0
	match cause:
		GlobalScope.Cause.CAUSE_GENERIC:
			print("Player died for unknown reasons")
		GlobalScope.Cause.CAUSE_INCINERATION:
			print("Player burned to death")
	state = GlobalScope.PlayerState.PLR_DEAD

var health : float = 100 ## The player's health.

# var dead : bool = false ## Did the player just [beep beep beep beep beeeeeeeep]?!

var state : GlobalScope.PlayerState = GlobalScope.PlayerState.PLR_ALIVE ## The current state of the player.

func _ready():
	if Globals.playerstate != null:
		position = Globals.playerstate.position
		rotation = Globals.playerstate.rotation
		Globals.playerstate = null
	Engine.max_fps = 30
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
@export var intensity = 10
@export var inputs = {"left":"ui_left","right":"ui_right","forward":"ui_up","backward":"ui_down","jump":"ui_accept"}
var ihitobject = null
var ihitdistance = null
var ihitrotation = null
var ihitposition = null
func line(pos1: Vector3, pos2: Vector3, color = Color.WHITE_SMOKE, persist_ms = 0):
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := StandardMaterial3D.new()

	mesh_instance.mesh = immediate_mesh
	#mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(pos1)
	immediate_mesh.surface_add_vertex(pos2)
	immediate_mesh.surface_end()

	#material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	material.no_depth_test = true

	return mesh_instance
var line_draw = null
var scaled = 1.0
@export var unsined := false ## Don't. Don't touch this, please, if you want the game to stay, don't touch this.
func _process(delta):
	if Globals.current_state == GlobalScope.GameState.PAUSED:
		get_tree().paused = true
	else:
		get_tree().paused = false
	if Input.is_action_just_pressed("pause"):
		if Globals.current_state == GlobalScope.GameState.PAUSED:
			Globals.current_state = GlobalScope.GameState.ACTIVE
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Globals.current_state = GlobalScope.GameState.PAUSED
			if not Globals.cheat_full_pause_disabled:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if state == GlobalScope.PlayerState.PLR_DEAD:
		$Camera3D/firepoint.visible = false
		if cam.position.y > -0.7:
			cam.position.y -= 2*delta
		else:
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				Globals.loadLastSave()
		if not deathUI.visible:
			deathUI.visible = true
		if not Globals.current_state == GlobalScope.GameState.PAUSED:
			return
	if Input.is_action_pressed("crouch"):
		scale.y = 0.6/scaled
		SPEED = C_SPEED
	elif Input.is_action_pressed("run") and sprint_enabled:
		scale.y = 1/scaled
		SPEED = R_SPEED
	else:
		scale.y = 1/scaled
		SPEED = D_SPEED
	if Input.is_action_just_pressed("run") and Input.is_action_pressed("crouch") and Globals.current_state == GlobalScope.GameState.PAUSED:
		Globals.cheat_full_pause_disabled = not Globals.cheat_full_pause_disabled
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.is_action_just_pressed("save"):
		Globals.saveGame("quick")
		hud.get_node("savebox").visible = true
		$Timer.start(0.5)
	if Input.is_action_just_pressed("load"):
		Globals.loadSave("quick")
	if line_draw != null:
		line_draw.get_parent().remove_child(line_draw)
		line_draw = null
	if Input.is_action_just_pressed("sizedown"):
		if ihitobject != null:
			ihitobject.scale = ihitobject.scale/2
		else:
			if scaled == 1: scaled += 1
			else: scaled += 2
	if Input.is_action_just_pressed("sizeup"):
		if ihitobject != null:
			ihitobject.scale = ihitobject.scale*2
		else:
			if scaled == 2: scaled -= 1
			else: scaled -= 2
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if rc.is_colliding():
			var body = rc.get_collider()
			if body is RigidBody3D or Globals.cheat_full_pause_disabled:
				if ihitobject == null:
					ihitobject = body
					ihitdistance = position.distance_to(body.global_position)
					ihitposition = position - rc.get_collision_point()
		if ihitobject != null:
			if Input.is_action_just_pressed("windback"):
				ihitdistance -= delta*5
			if Input.is_action_just_pressed("windaway"):
				ihitdistance += delta*5
			
			#var z = ihitdistance * cos(rotation.y)
			#var x = ihitdistance * sin(rotation.y)
			#var y = ihitdistance * sin(cam.rotation.x)
			var z = ihitdistance
			var x = ihitdistance
			var y = ihitdistance
			if not unsined:
				z = ihitdistance * cos(rotation.y)
				x = ihitdistance * sin(rotation.y)
				y = ihitdistance * sin(cam.rotation.x)
			else:
				z = ihitdistance * sin(rotation.y)
				x = ihitdistance * cos(rotation.y)
				y = ihitdistance * cos(cam.rotation.x)
			ihitobject.global_position = position - Vector3(x,-y,z)
			ihitobject.global_rotation = cam.global_rotation
			if ihitobject is RigidBody3D: ihitobject.linear_velocity = Vector3.ZERO
			#print(position)
			var l = line($Camera3D/firepoint.global_position,ihitobject.global_position)
			l.name = "line_draw"
			get_parent().add_child(l)
			line_draw = l
	else:
		ihitobject = null
		ihitdistance = null
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
	#	if rc.is_colliding():
	#		var body = rc.get_collider()
	#		if body is RigidBody3D:
	#			var l = line($Camera3D/firepoint.global_position,-rc.get_collision_normal()*intensity + body.position)
	#			l.name = "line_draw"
	#			get_parent().add_child(l)
	#			line_draw = l
	#			#body.apply_force(rc.get_collision_point()*intensity)
	#			body.apply_force(-rc.get_collision_normal()*intensity,body.position)
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
	#	if rc.is_colliding():
	#		var body = rc.get_collider()
	#		if body is RigidBody3D:
	#			var l = line($Camera3D/firepoint.global_position,rc.get_collision_normal()*intensity + body.position,Color.RED)
	#			l.name = "line_draw"
	#			get_parent().add_child(l)
	#			line_draw = l
	#			body.apply_force(-body.transform.basis.z,body.position)

var SPEED := 5.0 ## The speed the player moves at.

const D_SPEED := 5.0 ## The speed the player walks at.
const R_SPEED := 7.5 ## The speed the player runs at.
const C_SPEED := 2.5 ## The speed the player walks while crouching.
@export var sprint_enabled := true
const JUMP_VELOCITY := 4.5 ## The height the player jumps.

@onready var cam : Camera3D = get_node("Camera3D") ## The player's camera.
@onready var rc : RayCast3D = cam.get_node("RayCast3D") ## The player's RayCast3D
@onready var hud : Control = get_node("hud") ## The player's Heads-Up Display
@onready var deathUI : Control = hud.get_node("death") ## The death UI element

func _physics_process(delta: float) -> void:
	if state == GlobalScope.PlayerState.PLR_DEAD:
		if not Globals.current_state == GlobalScope.GameState.PAUSED:
			return
	if Globals.current_state == GlobalScope.GameState.PAUSED and not Globals.cheat_full_pause_disabled:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(inputs.jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector(inputs.left, inputs.right, inputs.forward, inputs.backward)
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if unsined:
		var z = input_dir.y * sin(rotation.y)
		var x = input_dir.x * cos(rotation.y)
		var y = 0 * cos(cam.rotation.x)
		direction = Vector3(x,0,z)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		cam.rotation_degrees.x -= event.relative.y/scaled
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x,-75,75)
		rotation_degrees.y -= event.relative.x


func _on_area_3d_body_entered(body: Node3D) -> void:
	if state == GlobalScope.PlayerState.PLR_DEAD:
		return
	if body is RigidBody3D:
		body.sleeping = false
		body.freeze = false
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	hud.get_node("savebox").visible = false
	pass # Replace with function body.
