extends Area2D
var laps = 0
onready var Score_label = get_tree().get_nodes_in_group("Score_label")[0]
onready var win_screen = get_tree().get_nodes_in_group("win_screen")[0]
onready var End_timer = get_tree().get_nodes_in_group("End_timer")[0]
onready var timer_display = get_tree().get_nodes_in_group("timer_display")[0]
onready var Best_times = get_tree().get_nodes_in_group("Best_times")[0]
onready var Database= get_tree().get_nodes_in_group("DB")[0]
onready var Teleport = get_tree().get_nodes_in_group("Teleporter")
onready var globals= get_node("/root/Globals")
onready var race_time= get_node("/root/RaceTime")
onready var global_username= get_node("/root/GlobalUsername")
onready var map_id= get_node("/root/MapId")



onready var current_level = int(get_tree().get_root().name[-1])

func _ready():
	if len(Teleport) != 0:
		Teleport = Teleport[0]
	else:
		# we are in a level without a teleport
		Teleport = null

func format_time(ms):
	var s = (ms/100)%60
	var m = (ms/(100*60))%60
	var new_ms = ms-s*100
	race_time.time_arr.append(ms)
	print(race_time.time_arr[0])
	return (str(m) + ":" + "%02d"%s + ":" + str(new_ms))

func _on_Area2D_body_entered(body):
	var checked_Array = []
	for x in get_tree().get_nodes_in_group("Checkpoints"):
		checked_Array.append(x.checked)
		x.checked = false
	if !checked_Array.has(false) :
		laps += 1
		Score_label.text = "LAPS: "+str(laps)
	if laps == 1:
		print(map_id.map_id)
		print(race_time.time_arr)
		#When the lap count has been completed
		win_screen.visible = true 
		End_timer.text = "Time: " + timer_display.format_time()
		globals.best_times.append(timer_display.ms)
		globals.best_times.sort()
		globals.best_times = globals.best_times.slice(0, 5)
		var timeString = "Best Times:"
		for time in globals.best_times:
			timeString += "\n" + format_time(time)
		Best_times.text = timeString
		if len(global_username.Current_user) == 1:
			Database.Time_add()
