extends TextureButton
onready var CreateUsername = get_tree().get_nodes_in_group("CreateUsername")[0]
onready var CreatePassword = get_tree().get_nodes_in_group("CreatePassword")[0]
onready var Confimedpassword = get_tree().get_nodes_in_group("Confimedpassword")[0]
onready var Database = get_tree().get_nodes_in_group("DB")[0]
onready var message_screen = get_tree().get_nodes_in_group("creation_message_screen")[0]
onready var screen_text = get_tree().get_nodes_in_group("Creation_message")[0]



func _on_ConfirmCreation_pressed():
	print(Database.Userlist())
	var is_taken = (len(Database.Userlist()))
	if CreateUsername.get_text() == "" or CreatePassword.get_text() == "":
		message_screen.visible = true
		screen_text.set_text("Provide a proper username/password")
	elif Confimedpassword.get_text() != CreatePassword.get_text():
		message_screen.visible = true
		screen_text.set_text("Passwords do not match")
	elif CreateUsername.get_text() !="" and CreatePassword.get_text() != "" and CreatePassword.get_text() == Confimedpassword.get_text() and is_taken ==0:
		Database.firstUserCommitDataToDB()
	else:
		message_screen.visible = true
		screen_text.set_text("Username taken")



func _on_Button_pressed():
	message_screen.visible = false
