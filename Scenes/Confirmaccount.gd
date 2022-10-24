extends TextureButton
onready var CreateUsername = get_tree().get_nodes_in_group("CreateUsername")[0]
onready var CreatePassword = get_tree().get_nodes_in_group("CreatePassword")[0]
onready var Confimedpassword = get_tree().get_nodes_in_group("Confimedpassword")[0]
onready var Database = get_tree().get_nodes_in_group("DB")[0]



func _on_ConfirmCreation_pressed():
	if CreateUsername.get_text() == "":
		print("Provide a proper username")
	elif CreatePassword.get_text() == "":
		print("Enter a proper password")
	elif Confimedpassword.get_text() != CreatePassword.get_text():
		print("Passwords don't match")
	elif CreateUsername.get_text() !="" and CreatePassword.get_text()!= "" and Confimedpassword.get_text() == CreatePassword.get_text():
			Database.firstUserCommitDataToDB()
