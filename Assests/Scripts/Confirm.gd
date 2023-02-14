extends TextureButton
onready var Login_Screen = get_tree().get_nodes_in_group("Login_Screen")
onready var login_screen = get_tree().get_nodes_in_group("login_screen")[0]
onready var Create_Account_screen = get_tree().get_nodes_in_group("Create_Account_Screen")[0]
onready var Username = get_tree().get_nodes_in_group("Username")[0]
onready var Password = get_tree().get_nodes_in_group("Password")[0]
onready var Database = get_tree().get_nodes_in_group("DB")[0]
onready var Error_screen = get_tree().get_nodes_in_group("Login_message_screen")[0]
onready var Error_text = get_tree().get_nodes_in_group("Login_message_text")[0]
onready var global_username = get_node("/root/GlobalUsername")
onready var global_login_state = get_node("/root/GlobalLoginState")
onready var button_holder = get_tree().get_nodes_in_group("button_holder")[0]

func _on_Create_account_button_pressed():
	login_screen.get_node("Login_screen").visible = false
	login_screen.get_node("Create_Account_screen").visible = true


func _on_Back_pressed():
	Login_Screen.visible = true
	Create_Account_screen.visible = false




func _on_Home_pressed():
	get_parent().get_parent().get_parent().visible = false
	button_holder.visible = true
	


func _on_Error_screen_back_pressed():
	Error_screen.visible = false




func _on_Confirm_pressed():
	print(Database.UserCheck())
	if Username.get_text() == "":	
		Error_screen = true
		Error_text.set_text("Provide a proper username/password")
	elif Password.get_text() == "":
		Error_screen.visible = true
		Error_text.set_text("Provide a proper username/password")
	elif hash(Password.get_text()) == Database.UserCheck():
		Error_screen.visible = true
		global_username.Current_user.append(Username.get_text())
		Error_text.set_text("Login Complete\nWelcome " + global_username.Current_user[0])
		global_login_state.login_state.append("1")
		print(global_login_state.login_state)
		print(global_username.Current_user)
	else:
		Error_screen.visible = true
		Error_text.set_text("Username/Password incorrect")

