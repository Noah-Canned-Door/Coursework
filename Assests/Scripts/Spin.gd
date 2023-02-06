extends "res://Assests/Scripts/BasePowerup.gd"

func _init():
	time = 3

func activate_power():
	Car.get_node("AnimationPlayer").play("spin")
	Timer.start()

func _on_timer_timeout():
	queue_free()
