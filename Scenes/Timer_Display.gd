extends RichTextLabel
var ms = 0
var s = 0
var m = 0

func _process(delta):
	if ms > 9:
		s += 1
		ms = 0
	if s > 59:
		s = 0
		m +=1
	set_text(str(m)+":"+str(s)+":"+str(ms)+":")
	pass	
