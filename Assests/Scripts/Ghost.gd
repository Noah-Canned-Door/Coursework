extends "res://Assests/Scripts/BasePowerup.gd"

func _init():
	time = 5

func activate_power():
	Car.switch_to_collision_layer(true)
	Timer.start()

func _on_timer_timeout():
	Car.switch_to_collision_layer(false)
	queue_free()
