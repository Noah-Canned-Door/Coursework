extends TextureButton
onready var Login_Screen = get_tree().get_nodes_in_group("Login_Screen")[0]
onready var Create_Account_screen = get_tree().get_nodes_in_group("Create_Account_Screen")[0]
onready var Username = get_tree().get_nodes_in_group("Username")[0]
onready var Password = get_tree().get_nodes_in_group("Password")[0]
onready var Database = get_tree().get_nodes_in_group("DB")[0]


func _on_Create_account_button_pressed():
	Login_Screen.visible = false
	Create_Account_screen.visible = true


func _on_Back_pressed():
	Login_Screen.visible = true
	Create_Account_screen.visible = false




func _on_Home_pressed():
	print("hello")
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
	


func _on_Confirm_pressed():
	Database.commitDataToDB()
	if Username.get_text() == "":
		print("Provide a proper username")
	elif Password.get_text() == "":
		print("Enter a proper password")
	
