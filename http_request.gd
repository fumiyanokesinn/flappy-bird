extends Control


func _on_button_pressed():
	$HTTPRequest.request("http://localhost/api/user")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	var error = json.parse(body.get_string_from_utf8())
	
	if error == OK:
		var users = json.data
		for user in users:
			print(user)
	else:
		print("JSON Parse Error:",json.get_error_message(),"in",body.get_string_from_utf8(), " at line ", json.get_error_line())
	
