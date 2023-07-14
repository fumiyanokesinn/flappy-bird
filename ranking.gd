extends Control

var users = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request("http://localhost/api/user")

# 画面上にユーザデータを表示する
func showUsers(users : Array):
	var index = 0
	for user in users:
		var label = RichTextLabel.new()
		label.bbcode_enabled = true
		label.custom_minimum_size = Vector2(0,100)
		# 順位によってレイアウトを変更する
		setLabeltext(label,user,index)
		label.add_theme_font_size_override("normal_font_size",60)
		$VBox.add_child(label)
		index += 1

# RichTextLabelのTextに値を格納する
func setLabeltext(label : RichTextLabel,user : Dictionary,index : int):
	if index == 0:
		label.text = "[center][wave amp=50 freq=5]%s : %s" % [user.name,user.score]
	elif index == 1:
		label.text = "[center][wave amp=50 freq=5]%s : %s" % [user.name,user.score]
	elif index == 2:
		label.text = "[center][wave amp=50 freq=5]%s : %s" % [user.name,user.score]
	else :
		label.text = "[center]%s : %s" % [user.name,user.score]
	pass

# User検索APIのレスポンスを作成
func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	var error = json.parse(body.get_string_from_utf8())
	
	if error == OK:
		var users = json.data
		showUsers(users)
	else:
		print("JSON Parse Error:",json.get_error_message(),"in",body.get_string_from_utf8(), " at line ", json.get_error_line())
