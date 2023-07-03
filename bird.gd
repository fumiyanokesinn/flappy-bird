extends RigidBody2D

signal game_over

var touch_ground = false
# 衝撃の強さ
var palsePower = 50
# ジャンプの方向
var palseDirection = Vector2(0, -1).normalized()
# 衝突時の方向
var enteredDirection = Vector2(0, -5).normalized()
# 衝撃
@onready var palse = palseDirection * 50
@onready var enteredPalse = enteredDirection * 500
@onready var CollisionBird = $CollisionBird

func _ready():
	CollisionBird.disabled = false

func _integrate_forces(state:PhysicsDirectBodyState2D):
	if Global.isGaming:
		# スペースキー押下時に実行
		if Input.is_action_pressed("fling"):
			# 上方に飛ぶ
			state.apply_central_impulse(palse)
		

func _on_body_entered(body):
	if Global.isGaming:
		# 土管に衝突した場合
		if body.is_in_group("Blocks"):
			Global.isGaming = false
			set_collision_mask_value(1,false)
			apply_impulse(enteredPalse)
			apply_torque_impulse(60000)
			await get_tree().create_timer(3).timeout
			emit_signal("game_over")

