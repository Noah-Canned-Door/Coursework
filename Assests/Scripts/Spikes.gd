extends "res://Assests/Scripts/BasePowerup.gd"

func activate_power():
	Car.velocity = Vector2.ZERO
	queue_free()
