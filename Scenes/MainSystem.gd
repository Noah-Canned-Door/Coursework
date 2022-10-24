extends Node
onready var Login = get_tree().get_nodes_in_group("ConfirmLogin")[0]

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/database"

func _ready():
	db = SQLite.new()
	db.path = db_name
	removeDataFromDB()
	pass

func firstUserCommitDataToDB():
	db.open_db()
	var TableName = "Users"
	var dict : Dictionary = Dictionary()
	dict["UserName"] = Login.CreateUsername.get_text()
	dict["Passwordhash"] = hash(Login.CreatePassword.get_text())
	db.insert_row(TableName,dict)

func readFromDB():
	db.open_db()
	var TableName = "Player_Info"
	db.query("select * from " + TableName + ";")
	for i in range(0,db.query_result.size()):
		print("Query results ",db.query_result[i]["ID"],db.query_result[i]["UserName"],db.query_result[i]["Time"] )

func getItemsByUserID(id):
	db.open_db()
	db.query("SELECT * from Player_Info INNER join Map_info on Player_Info.MapID = Map_info.ID= " + str(id))
	for i in range(0,db.query_result.size()):
		print("Query results ",db.query_result[i]["UserName"],db.query_result[i]["Time"],db.query_result[i]["Name"])
	return db.query_result

func removeDataFromDB():
	db.open_db()
	db.query("DELETE from Users WHERE Users.UserName = '" + "a" + "'")
	
