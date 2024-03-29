extends Node
onready var create = get_tree().get_nodes_in_group("ConfirmCreation")
onready var Loginbutton = get_tree().get_nodes_in_group("Confirmlogin")
onready var Createusername = get_tree().get_nodes_in_group("CreateUsername")
onready var loginusername = get_tree().get_nodes_in_group("Username")
onready var loginpassword = get_tree().get_nodes_in_group("Password")
onready var race_time = get_node("/root/RaceTime")
onready var map_id = get_node("/root/MapId")
onready var global_username = get_node("/root/GlobalUsername")

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/database"

func _ready():
	db = SQLite.new()
	db.path = db_name
	removeDataFromDB()
	
	
	if len(create) != 0:
		create = create[0]
	if len(Loginbutton) != 0:
		Loginbutton = Loginbutton[0]
	if len(Createusername) != 0:
		Createusername = Createusername[0]
	if len(loginusername) != 0:
		loginusername = loginusername[0]
	if len(loginpassword) != 0:
		loginpassword = loginpassword[0]

func firstUserCommitDataToDB():
	db.open_db()
	var TableName = "Users"
	var dict : Dictionary = Dictionary()
	dict["UserName"] = create.CreateUsername.get_text()
	dict["Passwordhash"] = hash(create.CreatePassword.get_text())
	db.insert_row(TableName,dict)

func readFromDB():
	db.open_db()
	var TableName = "Users"
	db.query("select * from " + TableName + ";")
	for i in range(0,db.query_result.size()):
		print("Query results ",db.query_result[i]["ID"],db.query_result[i]["Username"],db.query_result[i]["Passwordhash"] )

func getItemsByUserID(id):
	db.open_db()
	db.query("SELECT * from Player_Info INNER join Map_info on Player_Info.MapID = Map_info.ID= " + str(id))
	for i in range(0,db.query_result.size()):
		print("Query results ",db.query_result[i]["UserName"],db.query_result[i]["Time"],db.query_result[i]["Name"])
	return db.query_result

func removeDataFromDB():
	db.open_db()
	db.query("DELETE from Users WHERE Users.UserName = '" + "d" + "'")
	
func Userlist():
	db.open_db()
	var userinput = Createusername.get_text()
	var funny = db.select_rows("Users","Username = '" + userinput + "'", ["Username"])
	return funny
func UserCheck():
	db.open_db()
	var correctUsername = loginusername.get_text()
	var correctPasswordhash = loginpassword.get_text()
	var password_checker = db.select_rows("Users","Username = '" + correctUsername + "'",["Passwordhash"])
	var player_password
	if len(password_checker) > 0:
		player_password = password_checker[0]["Passwordhash"]
	return player_password

func Time_add():
	db.open_db()
	var TableName = "Player_Info"
	var dict : Dictionary = Dictionary()
	dict["UserName"] = global_username.Current_user[0]
	dict["Time"] = race_time.time_arr[0]
	dict["MapID"] = map_id.map_id[0]
	db.insert_row(TableName,dict)
