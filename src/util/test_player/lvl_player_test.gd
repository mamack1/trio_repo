extends KinematicBody2D

var speed : int = 200
var jump_speed : int = -300
var gravity : int = 500
var gravity_state = true
var velocity = Vector2()
var air_jump = false
const ACCELERATION = 800.0
const FRICTION = 1000.0

onready var coyote_jump_timer  = $CoyoteJumpTimer
onready var starting_position = global_position

onready var animated_sprite_2d = $Sprite2D

func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed('move_right'):
		animated_sprite_2d.play("run")
		velocity.x += speed
		
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		
	handle_jump(delta)			
	var input_axis = Input.get_axis("move_left", "move_right")
	handle_acceleration(input_axis, delta)
	apply_friction(input_axis, delta)
	update_animations(input_axis)	
	
			
	if Input.is_action_just_pressed("grav_shift"):
			touching_floor()		
	velocity.y += gravity * delta

	velocity = move_and_slide(velocity, Vector2.UP)

func handle_acceleration(input_axis, delta):
	if input_axis != 0:
		velocity.x =  move_toward(velocity.x, speed * input_axis, ACCELERATION * delta)	
		
func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	
func handle_jump(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_speed
	else:
		if Input.is_action_just_released("jump") and velocity.y < jump_speed / 2:
			velocity.y = jump_speed / 2	
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor(): air_jump = true
		
		if (is_on_floor()) or coyote_jump_timer.time_left > 0.0:
			velocity.y += jump_speed
			
		if not is_on_floor():
			if Input.is_action_just_pressed("jump") and air_jump:
				velocity.y += jump_speed * delta
				air_jump = false
				
			if (is_on_ceiling()):
				velocity.y -= jump_speed
				
	var was_on_floor = is_on_floor()
	var just_left_ledge = was_on_floor and not is_on_floor() and velocity.y >= 0
	if just_left_ledge:
		coyote_jump_timer.start()
			
func grav_shift():
	if gravity_state == false:
		animated_sprite_2d.flip_v = false
		gravity += 1000
		gravity_state = true
	else:
		animated_sprite_2d.flip_v = true
		gravity -= 1000
		gravity_state = false
		print('Yoyo')

func touching_floor():
	if (is_on_floor()) or (is_on_ceiling()):
		grav_shift()
		
func update_animations(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")		
	if not is_on_floor():
		if is_on_ceiling():
			animated_sprite_2d.play("idle")
			if input_axis != 0:
				animated_sprite_2d.flip_h = (input_axis < 0)
				animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("jump")
		
func _physics_process(delta):
	get_input(delta)


func _on_hazardDetect_area_entered(_area):
	global_position = starting_position
