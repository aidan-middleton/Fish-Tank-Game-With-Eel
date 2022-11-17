extends CanvasLayer

func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/main.tscn")
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
