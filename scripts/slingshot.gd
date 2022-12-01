extends Line2D

class_name SlingShot

var player: Cat
var camera: Camera2D
var on_slingshot = true

func _ready():
	player = get_node("../Cat")
	camera = get_node("../Cat/Camera2d")
	initialize()
	
func _process(delta):
	if on_slingshot:
		var player_relative_position = player.position
		set_point_position(1, player_relative_position)
		
	if points[1].x > points[2].x and on_slingshot:
		print("falseee")
		points[1].x = points[2].x 
		on_slingshot = false
		# Animate point align

		
func initialize():
	print("initializeee")
	points[0].x = points[2].x 
	points[1].x = points[2].x 
	on_slingshot = true
