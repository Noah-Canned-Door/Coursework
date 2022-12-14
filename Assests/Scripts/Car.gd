extends KinematicBody2D

export(int) var braking = -450
export(int) var max_speed_reverse = 250

export(int) var slip_speed = 400  # Speed where traction is reduced
export(int) var traction_fast = 0.1  # High-speed traction
export(int) var traction_slow = 0.7  # Low-speed traction

export(int) var engine_power = 800

var accel = Vector2.ZERO

export(int) var wheel_base = 70
export(int) var steering_angle = 15

var velocity = Vector2.ZERO
var steer_angle

func _physics_process(delta):
	accel = Vector2.ZERO
	get_input()
	calculate_steering(delta)
	velocity += accel * delta
	velocity = move_and_slide(velocity)

func get_input():
	var turn = 0
	if Input.is_action_pressed("steer_right"):
		turn += 1
	if Input.is_action_pressed("steer_left"):
		turn -= 1
	steer_angle = turn * deg2rad(steering_angle)
	if Input.is_action_pressed("accelerate"):
		accel = transform.x * engine_power
	if Input.is_action_pressed("brake"):
		accel = transform.x * braking


func calculate_steering(delta):
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_angle) * delta
	var new_heading = (front_wheel - rear_wheel).normalized()
	var traction = traction_slow
	if velocity.length() > slip_speed:
		traction = traction_fast
	var d = new_heading.dot(velocity.normalized())
	if d > 0:
		velocity = velocity.linear_interpolate(new_heading * velocity.length(), traction)
	if d < 0:
		velocity = -new_heading * min(velocity.length(), max_speed_reverse)
	rotation = new_heading.angle()
