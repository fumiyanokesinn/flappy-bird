extends RichTextLabel

func _on_mouse_entered():
	text = "[center][shake rate=5.0 level=40 connected=1]%s" % [get_parsed_text()]


func _on_mouse_exited():
	text = "[center]%s" % [get_parsed_text()]
