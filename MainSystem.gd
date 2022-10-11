extends Node2D

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/database"

func _ready():
	db = SQLite.new()
	db.path = db_name
	var  item_Result = getItemsByUserID(1)
	pass

func commitDataToDB():
	db.open_db()
	var TableName = "Player_Info"
	var dict : Dictionary = Dictionary()
	dict["UserName"] = "noch99"
	dict["Time"] = 000537
	
	db.insert_row(TableName,dict)

func readFromDB():
	db.open_db()
	var TableName = "Player_Info"
	db.query("select * from " + TableName + ";")
	for i in range(0,db.query_result.size()):
		print("Query results ",db.query_result[i]["UserName"],db.query_result[i]["Time"] )

func getItemsByUserID(id):
	db.open_db()
	db.query("select Player_Info.UserName as Uname,Player_Info.Time as Time,Map_info.Name as Mname from Player_Info INNER join Map_info on Player_Info.ID = Map_info.PlayerID where Player_Info.ID = " + str(id))
	for i in range(0,db.query_result.size()):
		print("Query results ",db.query_result[i]["Uname"],db.query_result[i]["Time"],db.query_result[i]["Mname"])
	return db.query_result
