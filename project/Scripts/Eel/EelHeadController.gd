extends KinematicBody

const move_speed: float = 4.0
const rotation_speed: float = 0.01

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
			KEY_I:
				_up = event.pressed
			KEY_K:
				_down = event.pressed
			KEY_J:
				_left = event.pressed
			KEY_L:
				_right = event.pressed

func _physics_process(delta: float) -> void:
	var _velocity = Vector3(get_global_transform().basis.z * move_speed) 
	translate(-get_global_transform().basis.z * move_speed * delta)

	
	var _pitch: float = _up as float - _down as float
	var _yaw: float = _left as float - _right as float
	
	var _direction = Vector3(_pitch,_yaw,0)
	rotate(_direction, rotation_speed)
	
#	var rot = Quat(rotation)
#	look_at(UP_LOCATION, Vector3.UP)
#	var target_rot = Quat(rotation)
#	rotation = rotation.slerp(target_rot, rotation_speed)
#	transform.basis = Basis(rotation)
