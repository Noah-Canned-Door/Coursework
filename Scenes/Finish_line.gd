extends Area2D
var laps = 0
onready var Score_label = get_tree().get_nodes_in_group("Score_label")[0]
onready var win_screen = get_tree().get_nodes_in_group("win_screen")[0]
onready var End_timer = get_tree().get_nodes_in_group("End_timer")[0]
onready var timer_display = get_tree().get_nodes_in_group("timer_display")[0]

func _on_Area2D_body_entered(body):
	var checked_Array = []
	for x in get_tree().get_nodes_in_group("Checkpoints"):
		checked_Array.append(x.checked)
		x.checked = false
	if !checked_Array.has(false):
		laps += 1
		Score_label.text = "LAPS: "+str(laps)
	if laps == 10:
		#When the lap count has been completed
		win_screen.visible = true 
		End_timer.text = "Time: " + timer_display.format_time()
