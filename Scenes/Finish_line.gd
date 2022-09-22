extends Area2D
var laps = 0
onready var Score_label = get_tree().get_nodes_in_group("Score_label")[0]


func _on_Area2D_body_entered(body):
	var checked_Array = []
	for x in get_tree().get_nodes_in_group("Checkpoints"):
		checked_Array.append(x.checked)
		x.checked = false
	if !checked_Array.has(false):
		laps += 1
		Score_label.text = "LAPS: "+str(laps)
