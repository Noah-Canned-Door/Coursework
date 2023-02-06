extends Node2D

var powerray = [load("res://Scenes/Clown.tscn"), load("res://Scenes/Ghost.tscn"), load("res://Scenes/Spikes.tscn"), load("res://Scenes/Rocket_boost.tscn"), load("res://Scenes/Spin.tscn")]
var pointsdict = {}

func _on_Timer_timeout():
	var points = get_tree().get_nodes_in_group("spawnpoints")
	var random_point = points[randi() % points.size()]
	
	
	var random_powerup = powerray[randi() % powerray.size()]
	
	call_powerup(random_point, random_powerup)

func call_powerup(point, powerup):
	var power_object = powerup.instance()
	get_parent().add_child(power_object)
	power_object.global_transform.origin = point.global_transform.origin


func _on_KILLTIMER_timeout():
	for x in get_tree().get_nodes_in_group("powerup"):
		x.queue_free()
