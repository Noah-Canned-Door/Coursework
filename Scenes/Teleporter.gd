extends Area2D
onready var Car = get_tree().get_nodes_in_group("Car")
export (Vector2) var pos = Vector2(0,0)
var fallen_off = false


func _on_Teleporter_body_entered(body):
	if body.name  == "Car":
		body.global_transform.origin = pos
		body.rotation = 0
		body.velocity = Vector2.ZERO
		fallen_off = true
