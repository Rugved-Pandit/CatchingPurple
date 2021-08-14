extends KinematicBody2D

var motion = Vector2()
var ccc = 0
var randome_speed = RandomNumberGenerator.new()
var dir = 0


func random_ctime():
	randomize()
	return rand_range(735, 1200)
	
func _ready():
	global_position.x = random_ctime()
	global_position.y = 222


func _physics_process(delta):
	ccc = get_parent().counter_player
	
	#if ccc %4 == 2:
	if ccc %3 == 2:
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
		if get_parent().pos_child.x - get_parent().pos_child3.x < 0:
			motion.x = -150*0.6
		else:
			motion.x = 150*0.6
		if get_parent().pos_child.y - get_parent().pos_child3.y < 0:
			motion.y = -150*0.6
		else: 
			motion.y = 150*0.6
	
	#teleportation
	if 33 > get_parent().pos_child3.x and get_parent().pos_child3.x > 31:
		if 353 > get_parent().pos_child3.y and get_parent().pos_child3.y > 351:
			get_parent().get_child(3).position.x = 1824
			get_parent().get_child(3).position.y =  863
	
	if 1825 > get_parent().pos_child3.x and get_parent().pos_child3.x > 1823:
		if 865 > get_parent().pos_child3.y and get_parent().pos_child3.y > 862:
			get_parent().get_child(3).position.x = 32
			get_parent().get_child(3).position.y = 352
	
	move_and_slide(motion)
