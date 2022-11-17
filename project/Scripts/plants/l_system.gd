tool
class_name LSystem

var axiom : String = "F"
var rules = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	read_rules("F:R+F+R;R:FF")
	print(rules)
	gen_sentence(3)

func read_rules(rules_str : String):
	for rule in rules_str.split(";"):
		rules.merge({ rule.split(":")[0] : rule.split(":")[1]})

func gen_sentence(generations : int) -> String:
	var sentence: String = axiom
	
	for i in (generations):
		var tmp: String = ""
		for character in sentence:
			if rules.has(character):
				tmp += rules.get(character)
			else:
				tmp += character
		sentence = tmp
	
	return sentence
