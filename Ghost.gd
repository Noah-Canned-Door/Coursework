extends Area2D

# The duration of the invincibility, in seconds
var invincibility_duration = 5

# A timer to keep track of how long the invincibility has been active
var invincibility_timer

# A flag to indicate whether the player is currently invincible
var invincible = false

func _ready():
	# Set the invincibility timer to 0 when the powerup is first created
	invincibility_timer = 0

func _physics_process(delta):
	# If the invincibility is active (invincibility timer is greater than 0)
	if invincibility_timer > 0:
		# Decrement the invincibility timer by the delta time
		invincibility_timer -= delta
		# If the invincibility timer has run out
		if invincibility_timer <= 0:
			# Reset the invincibility timer to 0
			invincibility_timer = 0
			# Set the invincible flag to false
			invincible = false

func _on_Area2D_body_entered(body):
	# If the player collides with the powerup and is not currently invincible
	if body.name == "Car" and not invincible:
		# Activate the invincibility
		activate_invincibility()
		# Delete the powerup from the scene
		queue_free()

func activate_invincibility():
	# Set the invincibility timer to the invincibility duration
	invincibility_timer = invincibility_duration
	# Set the invincible flag to true
	invincible = true
