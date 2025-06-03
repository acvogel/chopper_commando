extends CharacterBody2D

var speed = 0
var speed_increment = 50
@export var bomb_scene: PackedScene

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
	if Input.is_action_just_pressed("input_space"):
		spawn_bomb()
	return delta_velocity
	
func spawn_bomb():
	var bomb = bomb_scene.instantiate()
	bomb.linear_velocity = velocity
	bomb.global_position = global_position
	bomb.global_position.y += 40.0
	add_sibling(bomb)
	
func _physics_process(delta):
	var delta_velocity = get_input()
	velocity += delta_velocity
	move_and_slide()
