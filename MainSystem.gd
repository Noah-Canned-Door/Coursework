extends Node

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/database"

func _ready():
	db = SQLite.new()
	db.path = db_name
	var item_Result = getItemsByUserID(1)
	pass

func commitDataToDB():
	db.open_db()
	var TableName = "Player_Info"
	var dict : Dictionary = Dictionary()
	dict["UserName"] = "Octowhat"
	dict["Time"] = 105327
	dict["MapID"] = 1
	
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
	db.query("DELETE from Player_Info WHERE Player_Info.UserName = '" + "Octowhat" + "'")
	
