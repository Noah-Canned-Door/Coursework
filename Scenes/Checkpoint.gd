extends Area2D
var checked = false

func _on_checkpoint_body_entered(body):
	if body.name == "Car":
		checked = true
