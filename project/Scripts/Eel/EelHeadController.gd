extends KinematicBody


const move_speed: float = 8.0
const rotation_speed: float = 3.0

onready var parent: Spatial = get_parent()

# default look states
var UP_LOCATION = Vector3(1, 1, 1)

# Keyboard state
var _up = false
var _down = false
var _left = false
var _right = false

func _input(event):
	# Receives key input
	if event is InputEventKey:
		match event.scancode:

			KEY_W:
				_up = event.pressed
			KEY_S:
				_down = event.pressed
			KEY_A:
				_left = event.pressed
			KEY_D:
				_right = event.pressed

func _physics_process(delta: float) -> void:
	var _velocity = get_transform().basis.z * move_speed
	#translate(-get_global_transform().basis.z * move_speed * delta)
	
	move_and_slide(_velocity)
	
	var _pitch: float = _down as float - _up as float
	var _yaw: float = _left as float - _right as float
	
	#var _direction = Vector3(0,0,0) + get_transform().basis.x * _pitch + get_transform().basis.y * _yaw
	#rotate(_direction, rotation_speed)
	
	transform.basis = transform.basis.rotated(transform.basis.x, _pitch * rotation_speed * delta)
	
	print(rotation.x, rotation.y, rotation.z)
	
	transform.basis = transform.basis.rotated(Vector3.UP, _yaw * rotation_speed * delta)
	
	if _pitch == 0:
		rotation.x = lerp(rotation.x, 0.0, delta * rotation_speed)
		rotation.z = lerp(rotation.z, 0.0, delta * rotation_speed)
