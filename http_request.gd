extends Control

const POSITION_X = 600
var POSITION_Y = 200

func _on_button_pressed():
	$HTTPRequest.request("http://localhost/api/user")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	var error = json.parse(body.get_string_from_utf8())
	
	if error == OK:
		var users = json.data
		for user in users:
			print(user)
			var label = Label.new()
			label.text = "%s : %s" % [user.name,user.score]
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			label.add_theme_font_size_override("font_size",60)
			$VBox.add_child(label)
	else:
		print("JSON Parse Error:",json.get_error_message(),"in",body.get_string_from_utf8(), " at line ", json.get_error_line())
	
