extends CharacterBody2D

var speed = 0
var speed_increment = 50

func get_input():
	var delta_velocity = Vector2(0,0)
	if Input.is_action_just_pressed("input_right"):
		delta_velocity.x += speed_increment
	if Input.is_action_just_pressed("input_left"):
		delta_velocity.x -= speed_increment	
	if Input.is_action_just_pressed("input_up"):
		delta_velocity.y -= speed_increment
	if Input.is_action_just_pressed("input_down"):
			delta_velocity.y += speed_increment
	return delta_velocity
			
func _physics_process(delta):
	var delta_velocity = get_input()
	velocity += delta_velocity
	move_and_slide()
