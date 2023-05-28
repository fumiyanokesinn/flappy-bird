extends RigidBody2D

# 衝撃の強さ
var palsePower = 50
# 衝撃の方向
var palseDirection = Vector2(0, -1).normalized()
# 衝撃
@onready var palse = palseDirection * palsePower

# Called when the node enters the scene tree for the first time.
func _ready():
	print(palse)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state:PhysicsDirectBodyState2D):
	# スペースキー押下時に実行
	if Input.is_action_pressed("fling"):
		# 上方に飛ぶ
		state.apply_central_impulse(palse)
	
