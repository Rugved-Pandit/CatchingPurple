extends Node


func _input(event):
	if get_tree().paused == false:
		if Input.is_action_just_pressed("ui_esc"):
			get_tree().paused = true
	else:
		get_tree().paused = false
