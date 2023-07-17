extends StaticBody2D

# 移動速度
var velocity = Vector2(-300, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 位置に速度を足し込む
	position += velocity * delta
	# 画面外に出たら消える
	if (position.x < -200):
		queue_free()
