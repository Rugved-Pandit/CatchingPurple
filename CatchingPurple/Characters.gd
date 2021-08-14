extends Node

var counter_player = 0
var pos_child = 0
var pos_child1 = 0
var pos_child2 = 0
var pos_child3 = 0
var pos_child0 = 0
var GameEndVisible = false


func _physics_process(delta): 
	if get_child(0).end:
		#print("PAUSED")
		#get_tree().paused = true
		$GameEnd/MarginContainer.visible = true
		GameEndVisible = true
	
	if !GameEndVisible:
		$GameEnd/MarginContainer.visible = false
	
	if Input.is_action_just_pressed("ui_accept"):
		counter_player +=1
		print("ENTER  " + str(counter_player))
	
	pos_child0 = get_child(0).global_position
	pos_child1 = get_child(1).global_position
	pos_child2 = get_child(2).global_position
	pos_child3 = get_child(3).global_position
	
	if counter_player%3 == 0:
		pos_child = pos_child1
	elif counter_player%3 == 1:
		pos_child = pos_child2
	elif counter_player%3 == 2:
		pos_child = pos_child3

func _input(event):
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().change_scene("res://Menu.tscn")
