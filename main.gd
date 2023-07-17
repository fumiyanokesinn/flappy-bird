extends Node

const BLOCK_BASE_X = 1800
var dokan_cnt = 0

var score = 0
var startTimer = 3

@onready var Count = $HUD/VBoxContainer/Count
@onready var StartTimer = $HUD/StartCount/StartTimer
@onready var StartCount = $HUD/StartCount


var Block = preload("res://block.tscn")
var GameOver = preload("res://game_over.tscn")

func start_count():
	StartCount.show()
	StartTimer.start()
	get_tree().paused = true

func _ready():
	start_count()

# 土管が画面外に行った時に土管を再出現する
func _on_block_tree_exiting():
	
	# 出現回数をカウントアップ
	dokan_cnt += 1
	
	var ybase = randf_range(-250,180)
	var block = Block.instantiate()
	block.position.x = BLOCK_BASE_X
	block.position.y = ybase
	block.tree_exiting.connect(_on_block_tree_exiting)
	# 土管を再出現
	add_child.call_deferred(block)
	block.get_node("PointArea").body_exited.connect(_on_point_area_body_exited)

func _on_point_area_body_exited(_body:Node):
	if Global.isGaming:
		$AreaExitedSound.play()
		score += 1
		Count.text = str(score)


func _on_start_timer_timeout():
	startTimer -= 1
	
	if startTimer == 0:
		# 3秒経過後
		$StartSound.play()
		get_tree().paused = false
	elif startTimer == -1:
		StartCount.hide()
		StartTimer.stop()
	else:
		$TimerSound.play()
	
	StartCount.text = str(startTimer)




func _on_bird_game_over():
	sendPostRequest()
	SceneTransction.change_scene(GameOver,Global.DARK_BLUE)

# 登録APIを送信する
func sendPostRequest():
	var json = JSON.stringify({"name":Global.playerName if Global.playerName != "" else "nanasi", "score":score})
	print(json)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(Global.USER_URL,headers,HTTPClient.METHOD_POST,json)


