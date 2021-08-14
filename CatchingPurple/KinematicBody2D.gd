extends KinematicBody2D

var motion = Vector2()

var ccc = 0
var count = 0


func random_ctime():
	randomize()
	return rand_range(420, 850)
	
func _ready():
	global_position.x = 352
	global_position.y = random_ctime()

func _physics_process(delta):
	ccc = get_parent().counter_player
	
	#if ccc %4 == 0:
	if ccc %3 == 0:
		if Input.is_action_pressed("ui_left"):
			motion.x = -150
		elif Input.is_action_pressed("ui_right"):
			motion.x = 150
		else:
			motion.x = 0
		if Input.is_action_pressed("ui_up"):
			motion.y = -150
		elif Input.is_action_pressed("ui_down"):
			motion.y = 150
		else:
			motion.y = 0
	else:
		if get_parent().pos_child.x - get_parent().pos_child1.x < 0:
			motion.x = -150*0.6
		else:
			motion.x = 150*0.6
		if get_parent().pos_child.y - get_parent().pos_child1.y < 0:
			motion.y = -150*0.6
		else: 
			motion.y = 150*0.6
	
	print("x " + str(get_parent().pos_child1.x))
	print("y " + str(get_parent().pos_child1.y))
	
	#teleportation
	if 33 > get_parent().pos_child1.x and get_parent().pos_child1.x > 31:
		if 353 > get_parent().pos_child1.y and get_parent().pos_child1.y > 351:
			get_parent().get_child(1).position.x = 1824
			get_parent().get_child(1).position.y =  863
	
	if 1825 > get_parent().pos_child1.x and get_parent().pos_child1.x > 1823:
		if 865 > get_parent().pos_child1.y and get_parent().pos_child1.y > 862:
			get_parent().get_child(1).position.x = 32
			get_parent().get_child(1).position.y = 352
	
	#print("d " + str(Vector2().distance_to(get_parent().pos_child2)))
	move_and_slide(motion)
