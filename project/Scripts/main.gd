extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var body = preload("res://Scenes/Eel/eel_main.tscn")
onready var terrain = preload("res://Scenes/terrain/Terrain.tscn")
onready var kelp = preload("res://Scenes/plants/Kelp.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var eel = body.instance()
	eel.transform.origin = Vector3(0,5,0)
	add_child(eel)
	
	var ground = terrain.instance()
	ground.transform.origin = Vector3(0,0.5,0)
	add_child(ground)

func _input(event):
	# Receives key input
	if event is InputEventKey:
		match event.scancode:
			KEY_HOME:
				get_tree().change_scene("res://Scenes/GameOver.tscn")
			KEY_END:
				get_tree().quit()
