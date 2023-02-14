extends Button
onready var map_id = get_node("/root/MapId")


func _on_Home_Screen_pressed():
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
	map_id.map_id.clear()
