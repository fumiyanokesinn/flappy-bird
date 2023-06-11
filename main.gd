extends Node2D

const BLOCK_BASE_X = 1280
var dokan_cnt = 0
@export var blockScene:PackedScene

# 土管が画面外に行った時に土管を再出現する
func _on_block_tree_exiting():
	
	# 出現回数をカウントアップ
	dokan_cnt += 1
	
	var ybase = randf_range(150,600)
	for i in range(2):
		var block = blockScene.instantiate()
		block.position.x = BLOCK_BASE_X
		
		# 土管の位置を設定
		if i ==  0:
			block.position.y = ybase + 400
			block.tree_exiting.connect(_on_block_tree_exiting)
		else :
			block.position.y = ybase -400
		
		# 土管の速度を設定
		block.velocity.x = -20 * dokan_cnt + block.velocity.x
		
		# 土管を再出現
		add_child.call_deferred(block)

