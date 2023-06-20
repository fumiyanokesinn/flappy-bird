extends Node

const BLOCK_BASE_X = 1500
var dokan_cnt = 0

var score = 0
var startTimer = 3

@onready var Count = $HUD/VBoxContainer/Count
@onready var StartTimer = $HUD/StartCount/StartTimer
@onready var StartCount = $HUD/StartCount

var Block = preload("res://block.tscn")

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
	
	
	# 土管の速度を設定
#	block.velocity.x = -200 * dokan_cnt + block.velocity.x
	
	# 土管を再出現
	add_child.call_deferred(block)

func _on_point_area_body_exited(body):
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
