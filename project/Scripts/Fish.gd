extends KinematicBody

var dir = 1

func _physics_process(delta: float) -> void:
	
	var _velocity = get_transform().basis.z * dir
	move_and_slide(_velocity)
	
	#var _direction = Vector3(0,0,0) + get_transform().basis.x * _pitch + get_transform().basis.y * _yaw
	#rotate(_direction, rotation_speed)
	transform.basis = transform.basis.rotated(transform.basis.x, rand_range(-2, 2) *delta)
	transform.basis = transform.basis.rotated(Vector3.UP, rand_range(-3, 3) * delta)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		dir *= -1
		break

func kill():
	get_parent().remove_child(self)

