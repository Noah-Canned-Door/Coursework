extends Area2D
var laps = 0


func _on_Area2D_body_entered(body):
	var checked_Array = []
	for x in get_tree().get_nodes_in_group("Checkpoints"):
		checked_Array.append(x.checked)
		x.checked = false
	if !checked_Array.has(false):
		laps += 1
		print("laps:"+ str(laps))
