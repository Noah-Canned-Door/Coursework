extends TextureButton
onready var map_id = get_node("/root/MapId")


func _on_Level_1_pressed():
		get_tree().change_scene("res://Scenes/World.tscn")
		map_id.map_id.append(0)


func _on_Level_2_pressed():
		get_tree().change_scene("res://Scenes/World_3.tscn")
		map_id.map_id.append(1)
