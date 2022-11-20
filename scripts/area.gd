extends Area2D

@export var point: int
@export var is_last: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").text = String.num(point) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_body_entered(body):
	var cat : Cat = body
	cat.update_score(point)


func _on_area_body_exited(body):
	if is_last :
		var cat : Cat = body
		cat.update_score(0)
