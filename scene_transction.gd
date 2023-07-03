extends CanvasLayer


func change_scene(target: PackedScene,color: Color) -> void:
	$ColorRect.color = color
	$AnimationPlayer.play("FeedIn")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(target)
	$AnimationPlayer.play_backwards("FeedIn")
