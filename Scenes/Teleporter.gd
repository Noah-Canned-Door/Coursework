extends Area2D
export (Vector2) var pos = Vector2(0,0)
var fallen_off = false
#func _ready():
	#print(get_parent().get_node("debug_pos").global_transform.origin)

func _on_Teleporter_body_entered(body):
	if body.name  == "Car":
		body.global_transform.origin = pos
		fallen_off = true
