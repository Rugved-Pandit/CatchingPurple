extends KinematicBody2D

var motion = Vector2()
var ccc = 0
var randome_speed = RandomNumberGenerator.new()
var dir = 0
var d1 = 0
var d2 = 0
var d3 = 0
var end = false


func random_ctime():
	randomize()
	return rand_range(930, 1503)
	
func _ready():
	global_position.x = random_ctime()
	global_position.y = 608
	motion.y = 200


func _physics_process(delta):
	ccc = get_parent().counter_player
	
	#if ccc %4 == 3:
	if false:
		if Input.is_action_pressed("ui_left"):
			motion.x = -200
		elif Input.is_action_pressed("ui_right"):
			motion.x = 200
		else:
			motion.x = 0
		if Input.is_action_pressed("ui_up"):
			motion.y = -200
		elif Input.is_action_pressed("ui_down"):
			motion.y = 200
		else:
			motion.y = 0
	else:
		if is_on_wall():
			dir += randome_speed.randi_range(1,4)
			if dir%4 == 0:
				if dir%2 == 0:
					motion.y = 0
				motion.x = -200
			if dir%4 == 1:
				if dir%2 == 0:
					motion.y = 0
				motion.x = 200
			if dir%4 == 2:
				if dir%2 == 0:
					motion.x = 0
				motion.y = -200
			if dir%4 == 3:
				if dir%2 == 0:
					motion.x = 0
				motion.y = 200
		############################
		#the part for avoiding the bodies
		dir += randome_speed.randi_range(0, 8)
		if dir %13 == 0:
			if get_parent().pos_child.y - get_parent().pos_child0.y < 128 and get_parent().pos_child.y - get_parent().pos_child0.y > -128:
				if get_parent().pos_child.x - get_parent().pos_child0.x < 0 and get_parent().pos_child.x - get_parent().pos_child0.x > -128:
					motion.x = 200
				elif get_parent().pos_child.x - get_parent().pos_child0.x > 0 and get_parent().pos_child.x - get_parent().pos_child0.x < 128:
					motion.x = -200
			elif get_parent().pos_child.x - get_parent().pos_child0.x < 128 and get_parent().pos_child.x - get_parent().pos_child0.x > -128:
				if get_parent().pos_child.y - get_parent().pos_child0.y < 0 and get_parent().pos_child.y - get_parent().pos_child0.y > -128:
					motion.y = 200
				elif get_parent().pos_child1.y - get_parent().pos_child0.y > 0 and get_parent().pos_child1.y - get_parent().pos_child0.y < 128:
					motion.y = -200
		#############################
	
	#print("x " + str(get_parent().pos_child0.x))
	#print("y " + str(get_parent().pos_child0.y))
	
	#teleportation from edges
	if 33 > get_parent().pos_child0.x and get_parent().pos_child0.x > 20:
		if 355 > get_parent().pos_child0.y and get_parent().pos_child0.y > 351:
			get_parent().get_child(0).position.x = 1821
			get_parent().get_child(0).position.y =  863
	
	if 1825 > get_parent().pos_child0.x and get_parent().pos_child0.x > 1823:
		if 867 > get_parent().pos_child0.y and get_parent().pos_child0.y > 862:
			get_parent().get_child(0).position.x = 34
			get_parent().get_child(0).position.y = 352
	
	#teteleporting from middle
	if 611 > get_parent().pos_child0.x and get_parent().pos_child0.x > 609:
		if 291 > get_parent().pos_child0.y and get_parent().pos_child0.y > 287:
			get_parent().get_child(0).position.x = 1380
			get_parent().get_child(0).position.y =  352
	
	if 1379 > get_parent().pos_child0.x and get_parent().pos_child0.x > 1377:
		if 355 > get_parent().pos_child0.y and get_parent().pos_child0.y > 351:
			get_parent().get_child(0).position.x = 608
			get_parent().get_child(0).position.y = 289
	
	#distance
	d1 = get_parent().pos_child0.distance_to(get_parent().pos_child1)
	#print("d1 " + str(d1) )
	d2 = get_parent().pos_child0.distance_to(get_parent().pos_child2)
	#print("d2 " + str(d2) )
	d3 = get_parent().pos_child0.distance_to(get_parent().pos_child3)
	#print("d3 " + str(d3) )
	if !end:
		if (d1<75 and d2<75) or (d1<75 and d3<75) or (d2<75 and d3<75):
			print("CLOSE")
			end = true
			get_tree().paused = true
	
	move_and_slide(motion)
