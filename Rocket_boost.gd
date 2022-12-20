extends Area2D

# How much the booster will boost the player's speed
export (int) var boost_amount = 1000

# The duration of the boost, in seconds
export (int) var boost_duration = 3

# A timer to keep track of how long the boost has been active
var boost_timer

func _ready():
	# Set the boost timer to 0 when the powerup is first created
	boost_timer = 0

func _physics_process(delta):
	# If the boost is active (boost timer is greater than 0)
	if boost_timer > 0:
		# Decrement the boost timer by the delta time
		boost_timer -= delta
		# Get the player's kinematic body
		var player = get_parent().get_node("Car")
		# Apply the boost force to the player's velocity
		player.velocity += transform.x * boost_amount
		# If the boost timer has run out
		if boost_timer <= 0:
			# Reset the boost timer to 0
			boost_timer = 0




func _on_Rocket_boost_body_entered(body):
	# If the player collides with the powerup
	if body.name == "Car":
		# Activate the boost
		activate_boost()
		queue_free()


func activate_boost():
	# Set the boost timer to the boost duration
	boost_timer = boost_duration
