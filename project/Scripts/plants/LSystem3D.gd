extends ImmediateGeometry

const Grammars = preload("res://Scripts/Plants/Grammars.gd")

export var length : float = 1
export var iterations : int = 4

func _ready(): 
	var start_position = global_transform.origin
	length *= length * pow(0.7, iterations)
	var grammar = Grammars.Kelp.new()
	var angle = grammar.get_angle()
	var sentence = gen_string(iterations, grammar)
	turtle(start_position, length, grammar, sentence, angle)

#Generate String for turtle
func gen_string(iterations, grammar):
	var sentence = grammar.axiom
	for i in iterations:
		var new_sentence = ""
		for character in sentence:
			new_sentence += grammar.get_character(character)
		sentence = new_sentence
	return sentence

#Draw the fractal
func turtle(start_position, length, grammar, sentence, angle):
	begin(Mesh.PRIMITIVE_LINES)
	var from = start_position
	print(start_position)

	var direction : Vector3 = Vector3(0,1,0)
	var queue = []
	
	for index in sentence:
		match grammar.get_action(index):
			"draw_forward":
				var to : Vector3 = from + direction * length
				add_vertex(from)
				add_vertex(to)
				from = to
			"rotate_right_x":
				direction = direction.rotated(Vector3(1,0,0),deg2rad(angle))
			"rotate_left_x":
				direction = direction.rotated(Vector3(1,0,0),deg2rad(-angle))
			"rotate_right_y":
				direction = direction.rotated(Vector3(0,1,0),deg2rad(angle))
			"rotate_left_y":
				direction = direction.rotated(Vector3(0,1,0),deg2rad(-angle))
			"rotate_right_z":
				direction = direction.rotated(Vector3(0,0,1),deg2rad(angle))
			"rotate_left_z":
				direction = direction.rotated(Vector3(0,0,1),deg2rad(-angle))
			"store":
				queue.push_back([from, direction])
			"load":
				var data = queue.pop_back()
				from = data[0]
				direction = data[1]
			"draw_leaf":
				pass
	end()

func _process(delta):
	#var camera_pos = get_viewport().get_camera().global_transform.origin
	#camera_pos.y = 0
	#look_at(camera_pos, Vector3(0, 1, 0))
	pass
