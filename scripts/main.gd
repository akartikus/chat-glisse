extends Node2D


var score: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cat_movement_stopped(score: int):
	print("Update score -> New cat ")
	print(score)
	score = score +1
	add_new_cat()

func add_new_cat():
	var cat : Cat = get_node("Cat")
	var slingshot : SlingShot = get_node("slingshot")
	
	cat.position = Vector2(slingshot.points[0].x, slingshot.points[1].y) 
	slingshot.initialize()

	
