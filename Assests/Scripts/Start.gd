extends Button
onready var global_login_state = get_node("/root/GlobalLoginState")
onready var login_screen = get_tree().get_nodes_in_group("login_screen")[0]


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Level_select.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Account_pressed():
	if len(global_login_state.login_state) == 1:
		login_screen.get_node("Login_screen").visible = false
		login_screen.get_node("Create_Account_screen").visible = false
		login_screen.get_node("Best_times").visible = true
	login_screen.visible = true
	get_parent().visible = false
