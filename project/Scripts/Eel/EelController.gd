extends Spatial

"""
Controls slither body/scale and score management
"""

onready var body: PackedScene = preload("res://Scenes/Eel/eel_body.tscn")
#onready var gui: Control = $GUI

var bodies: Array = []
var body_pool: Array = []

var start_length: int = 30
var segment_length: int = 4

var score: int = 0
var max_score: int = 30

onready var head: KinematicBody = $eel_head
#onready var camera: Camera = $camera

func _ready() -> void:
	head.get_node("Area").connect("area_entered", self, "_on_head_area_entered")
	
	for i in range(max_score * segment_length):	
		body_pool.append(body.instance()) 
	
	for i in range(start_length):
		add_body()

func add_body() -> void:
	
	var body_new: KinematicBody = body_pool.pop_front()
	
	if bodies.size() > 1:
		body_new.set_collision_layer_bit(0, true)
	
	add_child(body_new)
	if bodies.size() == 0:
		body_new.parent = head
	else:
		body_new.parent = bodies.back()
	bodies.append(body_new)
	
func eat():
	score += 1
	print(score)
	if score == 5:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
	else:
		for i in range(segment_length):
			add_body()

