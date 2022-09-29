extends RichTextLabel
var ms = 0



func _process(delta):
	text = format_time()

func _on_Timer_timeout():
	ms += 1

func format_time():
	var s = (ms/100)%60
	var m = (ms/(100*60))%60
	var new_ms = ms-s*100
	return (str(m) + ":" + "%02d"%s + ":" + str(new_ms))
