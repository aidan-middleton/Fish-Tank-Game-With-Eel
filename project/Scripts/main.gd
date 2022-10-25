extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var body = preload("res://Scenes/Eel/eel_main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
		var eel = body.instance()
		add_child(eel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


