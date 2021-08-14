extends Area2D

var z = 0

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	z+=1
	
	for body in bodies:
		if body.name == "Body2":
			print("b " + body.name + " " + str(z))
		#print("nothing")
	
	#print(bodies.size())
