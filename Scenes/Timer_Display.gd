extends RichTextLabel
var ms = 0
var s = 0
var m = 0


func _process(delta):
	if ms > 99:
		s += 1
		ms = 0
	if s > 59:
		s = 0
		m +=1
	set_text(str(m)+":"+ str("%02d" %s)+":"+str(ms))
	pass	


func _on_Timer_timeout():
	ms += 1
