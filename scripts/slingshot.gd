extends Line2D

var player: RigidBody2D
var camera: Camera2D
var on_slingshot = true

func _ready():
	player = get_node("../Cat")
	camera = get_node("../Cat/Camera2d")
	points[0].x = points[2].x
	
func _process(delta):
	if points[1].x > points[2].x:
		on_slingshot = false
		# Animate point align
		
	if on_slingshot:
		var player_relative_position = player.position
		set_point_position(1, player_relative_position)
