extends PathFollow2D

export (int) var AI_Speed = 30


func _process(delta):
	set_offset(get_offset() + AI_Speed * delta)
