extends "res://Assests/Scripts/BasePowerup.gd"

export (int) var boost_amount = 4209
func _init():
	time =3


func activate_power():
	Car.speed_boost(true,boost_amount)
	Timer.start()

func _on_timer_timeout():
	Car.speed_boost(false,0)
	queue_free()
