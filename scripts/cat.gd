extends RigidBody2D

class_name Cat

var drag_enabled = false
var impulse_direction = Vector2.ZERO
var initial_position: Vector2;
var screen_size

var score: int = 0
@export var clamp_limit : Vector2

func _ready():
	initial_position = position
	screen_size = get_viewport_rect().size
	var camera: Camera2D = get_node("Camera2d")
	var sprite: Sprite2D = get_node("Sprite2d")
	camera.limit_right = clamp_limit.x + sprite.texture.get_size().x/2
	camera.limit_left = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	slow_down_and_stop()
			
	if drag_enabled:
		position = get_global_mouse_position()

			
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MASK_LEFT and impulse_direction == Vector2.ZERO:
			drag_enabled = event.pressed;
			if not drag_enabled:
				release_cat()
			
func release_cat():
	var impulse_lenght = initial_position- position
	impulse_direction = impulse_lenght.normalized()
	apply_central_impulse(impulse_lenght * 8 * impulse_lenght.normalized().length())
	
func slow_down_and_stop():
	if(linear_velocity.x > 0 and linear_velocity.x < 250):
		linear_velocity.x -= 5
		if(linear_velocity.x <= 10):
			linear_velocity.x = 0
			linear_velocity.y = 0
			
	if(position.x >= clamp_limit.x):
		linear_velocity = Vector2.ZERO
		
	#position.y = clamp(position.y, 0 , screen_size.y)
			
func update_score(point: int):
	score = point
	print(score)
