extends Node

var counter_player = 0

func _physics_process(delta):
	if Input.is_action_pressed("ui_focus_next"):
		counter_player +=1
