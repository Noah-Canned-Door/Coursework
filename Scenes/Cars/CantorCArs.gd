extends KinematicBody2D

var direction = Vector2.ZERO
var speed = 1000

func _physics_process(delta):
	direction = Vector2.ZERO
	if Input.is_action_pressed("forward"):
		direction += Vector2.RIGHT
	
	direction.normalized()
	move_and_slide(direction*speed)
