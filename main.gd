extends Node2D

const BLOCK_BASE_X = 1280
@export var blockScene:PackedScene

# 土管が画面外に行った時に土管を再出現する
func _on_block_tree_exiting():
	var block = blockScene.instantiate()
	
	# ブロックの状態を設定する
	block.position.x = BLOCK_BASE_X
	block.tree_exiting.connect(_on_block_tree_exiting)
	# 土管を再出現
	add_child.call_deferred(block)

