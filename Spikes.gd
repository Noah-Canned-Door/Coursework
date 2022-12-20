extends Area2D

# The duration of the freeze, in seconds
export (int) var freeze_duration = 1

# A timer to keep track of how long the freeze has been active
var freeze_timer

func _ready():
	# Set the freeze timer to 0 when the powerup is first created
	freeze_timer = 0

func _physics_process(delta):
	# If the freeze is active (freeze timer is greater than 0)
	if freeze_timer > 0:
		# Decrement the freeze timer by the delta time
		freeze_timer -= delta
		# Get the player's kinematic body
		var player = get_parent().get_node("Car")
		# Stop the player's movement
		player.velocity = Vector2.ZERO
		# If the freeze timer has run out
		if freeze_timer <= 0:
			# Reset the freeze timer to 0
			freeze_timer = 0




func _on_Spikes_body_entered(body):
	# If the player collides with the powerup
	if body.name == "Car":
		# Activate the spin
		activate_freeze()
		# Delete the powerup from the scene
		queue_free()

func activate_freeze():
	# Set the freeze timer to the freeze duration
	freeze_timer = freeze_duration


