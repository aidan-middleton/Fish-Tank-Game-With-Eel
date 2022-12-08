class Grammar:
	var axiom
	var angle
	var rules = {}
	var actions = {
		"F" : "draw_forward",
		"*" : "draw_leaf",
		"+" : "rotate_right_z",
		"-" : "rotate_left_z",
		">" : "rotate_right_x",
		"<" : "rotate_left_x",
		"^" : "rotate_right_y",
		"&" : "rotate_left_y",
		"[" : "store",
		"]" : "load"
	}

	func get_angle() -> float:
		return angle
		
	func get_character(character):
		if rules.has(character):
			return rules.get(character)
		return character
	
	func get_action(character):
		return actions.get(character)
		
class DenseFern extends Grammar:
	func _init():
		self.axiom = "F"
		self.angle = 25
		self.rules = {
			"F" : "FF+[+F-F-F]-[-F+F+F]",
		}
		
class Fern extends Grammar:
	func _init():
		self.axiom = "X"
		self.angle = 25
		self.rules = {
			"X" : "F+[[X]-X]-F[-FX]+X",
			"F" : "FF"
		}

class Kelp extends Grammar:
	func _init():
		self.axiom = "^^X"
		self.angle = 22
		self.rules = {
			"F" : "FF",
			"X" : "F+[[X]-X]-F[-FX]+X",
		}
class SeaWeed extends Grammar:
	func _init():
		self.axiom = "F"
		self.angle = 22
		self.rules = {
			"F" : "FF-[&F^F^F]+[^F&F&F]>[^F^F&F]",
		}
		
class Simple extends Grammar:
	func _init():
		self.axiom = "F"
		self.angle = 25
		self.rules = {
			"F" : "FF",
		}
