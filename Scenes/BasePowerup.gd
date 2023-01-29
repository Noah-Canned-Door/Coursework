extends Area2D
onready var Car = get_tree().get_nodes_in_group("Car")[0]
onready var Timer = $Timer
onready var coll = $CollisionShape2D

var time = 5;

func _ready():
	Timer.wait_time = time

func _on_body_entered(body):
	if body.name == "Car":
		activate_power()
		visible = false
		coll.disabled = true

func activate_power():
	pass

func _on_timer_timeout():
	pass
