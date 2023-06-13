extends RigidBody2D

var game_over = false
var touch_ground = false
# 衝撃の強さ
var palsePower = 50
# ジャンプの方向
var palseDirection = Vector2(0, -1).normalized()
# 衝突時の方向
var enteredDirection = Vector2(-3, 1).normalized()
# 衝撃
@onready var palse = palseDirection * 50
@onready var enteredPalse = enteredDirection * 500

func _physics_process(delta):
	if touch_ground == true:
		apply_central_impulse(enteredPalse)
		apply_torque_impulse(30000)

func _integrate_forces(state:PhysicsDirectBodyState2D):
	if game_over == false:
		# スペースキー押下時に実行
		if Input.is_action_pressed("fling"):
			# 上方に飛ぶ
			state.apply_central_impulse(palse)
		

func _on_body_entered(body):
	# 土管に衝突した場合
	if body.is_in_group("Blocks"):
		touch_ground = true
		game_over = true
		# 物理判定を無くす
		set_collision_mask_value(1,false)


func _on_body_exited(body):
	# 土管に離れた場合
	if body.name == "Block":
		touch_ground = false
