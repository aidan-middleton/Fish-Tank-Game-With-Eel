extends KinematicBody

const move_speed: float = 4.0
const rotation_speed: float = 0.01

onready var parent: Spatial = get_parent()

# Keyboard state
var _i = false
var _k = false
var _j = false
var _l = false
var _u = false
var _o = false

func _input(event):
	# Receives key input
	if event is InputEventKey:
		match event.scancode:
			KEY_I:
				_i = event.pressed
			KEY_K:
				_k = event.pressed
			KEY_L:
				_l = event.pressed
			KEY_J:
				_j = event.pressed

func _physics_process(delta: float) -> void:
	var _velocity = Vector3(get_global_transform().basis.z * move_speed) 
	translate(-get_global_transform().basis.z * move_speed * delta)
	
	var _pitch: float = _i as float - _k as float
	var _yaw: float = _j as float - _l as float
	
	var _direction = Vector3(_pitch,_yaw,0)
	rotate(_direction, rotation_speed)
	
	
