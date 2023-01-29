extends "res://Scenes/BasePowerup.gd"

func _init():
	time = 3

func activate_power():
	Car.invert_controls(true)
	Timer.start()

func _on_timer_timeout():
	Car.invert_controls(false)
	queue_free()
