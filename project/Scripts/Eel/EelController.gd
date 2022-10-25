extends Spatial

"""
Controls slither body/scale and score management
"""

onready var body: PackedScene = preload("res://Scenes/Eel/eel_body.tscn")
#onready var gui: Control = $GUI

var bodies: Array = []

onready var head: KinematicBody = $eel_head
#onready var camera: Camera = $camera

func _ready() -> void:
	head.get_node("Area").connect("area_entered", self, "_on_head_area_entered")
	
	add_body()
	add_body()
	add_body()
	add_body()

func add_body() -> void:
	var body_new: KinematicBody = body.instance()
	add_child(body_new)
	if bodies.size() == 0:
		body_new.parent = head
	else:
		body_new.parent = bodies.back()
	bodies.append(body_new)
