extends KinematicBody2D

var speed : int = 400
var jump_speed : int = -200
var gravity : int = 200
var gravity_state = true
var velocity = Vector2()
var air_jump = false

onready var animated_sprite_2d = $Sprite2D
onready var coyote_jump_timer  = $CoyoteJumpTimer
onready var starting_position = global_position


func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed('move_right'):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
			
	handle_jump()
		
	if Input.is_action_just_pressed("grav_shift"):
			touching_floor()
			
	velocity.y += gravity * delta

	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	var just_left_ledge = was_on_floor and not is_on_floor() and velocity.y >= 0
	if just_left_ledge:
		coyote_jump_timer.start()

func handle_jump():
	if is_on_floor(): air_jump = true
	if is_on_floor() or coyote_jump_timer.time_left > 0.0:
		if Input.is_action_just_pressed("jump"):
			velocity.y += jump_speed
	if not is_on_floor():
		if Input.is_action_just_released("jump") and velocity.y < jump_speed / 2:
			velocity.y = jump_speed / 2	
			
		if Input.is_action_just_pressed("jump") and air_jump:	
			velocity.y += jump_speed * 0.8
			air_jump = false
				
		if (is_on_ceiling()):
			velocity.y -= jump_speed	
					
func grav_shift():
	if gravity_state == false:
		gravity += 400
		gravity_state = true
	else:
		gravity -= 400
		gravity_state = false
		print('Yoyo')

func touching_floor():
	if (is_on_floor()) or (is_on_ceiling()):
		grav_shift()

func _physics_process(delta):
	get_input(delta)

func _on_hazardDetect_area_entered(area):
	global_position = starting_position
